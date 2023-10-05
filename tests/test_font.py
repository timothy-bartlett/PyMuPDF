"""
Tests for the Font class.
"""
import fitz


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


def test_font2():
    """Old and new length computation must be the same."""
    font = fitz.Font("helv")
    text = "PyMuPDF"
    assert font.text_length(text) == fitz.get_text_length(text)


def test_fontname():
    """Assert a valid PDF fontname."""
    doc = fitz.open()
    page = doc.new_page()
    font = fitz.Font("helv")
    assert page.insert_font(fontname="legal", fontbuffer=font.buffer)
    detected = False  # preset indicator
    try:
        page.insert_font(fontname="illegal/char", fontbuffer=font.buffer)
    except ValueError:
        detected = True  # illegal fontname detected
    assert detected
