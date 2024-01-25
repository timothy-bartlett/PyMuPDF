"""
Tests for the Font class.
"""
import fitz
import os

def test_font1():
    text = "PyMuPDF"
    font = fitz.Font("helv")
    assert font.name == "Helvetica"
    tl = font.text_length(text, fontsize=20)
    cl = font.char_lengths(text, fontsize=20)
    assert len(text) == len(cl)
    assert abs(sum(cl) - tl) < fitz.EPSILON
    for i in range(len(cl)):
        assert cl[i] == font.glyph_advance(ord(text[i])) * 20
    font2 = fitz.Font(fontbuffer=font.buffer)
    assert font2.valid_codepoints() == font.valid_codepoints()
    
    # Also check we can get font's bbox.
    bbox1 = font.bbox
    print(f'{bbox1=}')
    if hasattr(fitz, 'mupdf'):
        bbox2 = font.this.fz_font_bbox()
        assert bbox2 == bbox1


def test_font2():
    """Old and new length computation must be the same."""
    font = fitz.Font("helv")
    text = "PyMuPDF"
    assert font.text_length(text) == fitz.get_text_length(text)


def test_fontname():
    """Assert a valid PDF fontname."""
    doc = fitz.open()
    page = doc.new_page()
    assert page.insert_font()  # assert: a valid fontname works!
    detected = False  # preset indicator
    try:  # fontname check will fail first - don't need a font at all here
        page.insert_font(fontname="illegal/char", fontfile="unimportant")
    except ValueError as e:
        if str(e).startswith("bad fontname chars"):
            detected = True  # illegal fontname detected
    assert detected

def test_2608():
    if fitz.mupdf_version_tuple <= (1, 23, 4):
        print( f'Not running test_2608 because mupdf too old: {fitz.mupdf_version_tuple=}')
        return
    flags = (fitz.TEXT_DEHYPHENATE | fitz.TEXT_MEDIABOX_CLIP)
    with fitz.open(os.path.abspath(f'{__file__}/../../tests/resources/2201.00069.pdf')) as doc:
        page = doc[0]
        blocks = page.get_text_blocks(flags=flags)
        text = blocks[10][4]
        with open(os.path.abspath(f'{__file__}/../../tests/test_2608_out'), 'wb') as f:
            f.write(text.encode('utf8'))
        with open(os.path.abspath(f'{__file__}/../../tests/resources/test_2608_expected'), 'rb') as f:
            expected = f.read().decode('utf8')
        # Github windows x32 seems to insert \r characters; maybe something to
        # do with the Python installation's line endings settings.
        expected = expected.replace('\r', '')
        print(f'test_2608(): {text.encode("utf8")=}')
        print(f'test_2608(): {expected.encode("utf8")=}')
        assert text == expected

def test_fontarchive():
    import subprocess
    arch = fitz.Archive()
    css = fitz.css_for_pymupdf_font("notos", archive=arch, name="sans-serif")
    print(css)
    print(arch.entry_list)
    assert arch.entry_list == \
            [
                {
                    'fmt': 'tree',
                    'entries':
                    [
                        'notosbo', 'notosbi', 'notosit', 'notos'
                    ],
                    'path': None
                }
            ]

def test_load_system_font():
    if not hasattr(fitz, 'mupdf'):
        print(f'test_load_system_font(): Not running on classic.')
        return
    if fitz.mupdf_version_tuple < (1, 24):
        print(f'test_load_system_font(): Not running because mupdf version < 1.24.')
        return
    trace = list()
    def font_f(name, bold, italic, needs_exact_metrics):
        trace.append((name, bold, italic, needs_exact_metrics))
        print(f'font_f(): Looking for font: {name=} {bold=} {italic=} {needs_exact_metrics=}.')
        return None
    def f_cjk(name, ordering, serif):
        trace.append((name, ordering, serif))
        print(f'f_cjk(): Looking for font: {name=} {ordering=} {serif=}.')
        return None
    def f_fallback(script, language, serif, bold, italic):
        trace.append((script, language, serif, bold, italic))
        print(f'f_fallback(): looking for font: {script=} {language=} {serif=} {bold=} {italic=}.')
        return None
    fitz.mupdf.fz_install_load_system_font_funcs(font_f, f_cjk, f_fallback)
    f = fitz.mupdf.fz_load_system_font("some-font-name", 0, 0, 0)
    assert trace == [
            ('some-font-name', 0, 0, 0),
            ], f'Incorrect {trace=}.'
    print(f'test_load_system_font(): {f.m_internal=}')

