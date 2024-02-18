"""
Pixmap tests
* make pixmap of a page and assert bbox size
* make pixmap from a PDF xref and compare with extracted image
* pixmap from file and from binary image and compare
"""

import fitz

import os
import platform
import sys
import tempfile
import pytest

scriptdir = os.path.abspath(os.path.dirname(__file__))
epub = os.path.join(scriptdir, "resources", "Bezier.epub")
pdf = os.path.join(scriptdir, "resources", "001003ED.pdf")
imgfile = os.path.join(scriptdir, "resources", "nur-ruhig.jpg")


def test_pagepixmap():
    # pixmap from an EPUB page
    doc = fitz.open(epub)
    page = doc[0]
    pix = page.get_pixmap()
    assert pix.irect == page.rect.irect
    pix = page.get_pixmap(alpha=True)
    assert pix.alpha
    assert pix.n == pix.colorspace.n + pix.alpha


def test_pdfpixmap():
    # pixmap from xref in a PDF
    doc = fitz.open(pdf)
    # take first image item of first page
    img = doc.get_page_images(0)[0]
    # make pixmap of it
    pix = fitz.Pixmap(doc, img[0])
    # assert pixmap properties
    assert pix.width == img[2]
    assert pix.height == img[3]
    # extract image and compare metadata
    extractimg = doc.extract_image(img[0])
    assert extractimg["width"] == pix.width
    assert extractimg["height"] == pix.height


def test_filepixmap():
    # pixmaps from file and from stream
    # should lead to same result
    pix1 = fitz.Pixmap(imgfile)
    stream = open(imgfile, "rb").read()
    pix2 = fitz.Pixmap(stream)
    assert repr(pix1) == repr(pix2)
    assert pix1.digest == pix2.digest


def test_pilsave():
    # pixmaps from file then save to pillow image
    # make pixmap from this and confirm equality
    try:
        pix1 = fitz.Pixmap(imgfile)
        stream = pix1.pil_tobytes("JPEG")
        pix2 = fitz.Pixmap(stream)
        assert repr(pix1) == repr(pix2)
    except ModuleNotFoundError:
        assert platform.system() == 'Windows' and sys.maxsize == 2**31 - 1


def test_save(tmpdir):
    # pixmaps from file then save to image
    # make pixmap from this and confirm equality
    pix1 = fitz.Pixmap(imgfile)
    outfile = os.path.join(tmpdir, "foo.png")
    pix1.save(outfile, output="png")
    # read it back
    pix2 = fitz.Pixmap(outfile)
    assert repr(pix1) == repr(pix2)


def test_setalpha():
    # pixmap from JPEG file, then add an alpha channel
    # with 30% transparency
    pix1 = fitz.Pixmap(imgfile)
    opa = int(255 * 0.3)  # corresponding to 30% transparency
    alphas = [opa] * (pix1.width * pix1.height)
    alphas = bytearray(alphas)
    pix2 = fitz.Pixmap(pix1, 1)  # add alpha channel
    pix2.set_alpha(alphas)  # make image 30% transparent
    samples = pix2.samples  # copy of samples
    # confirm correct the alpha bytes
    t = bytearray([samples[i] for i in range(3, len(samples), 4)])
    assert t == alphas

def test_color_count():
    '''
    This is known to fail if MuPDF is built without PyMuPDF's custom config.h,
    e.g. in Linux system installs.
    '''
    pm = fitz.Pixmap(imgfile)
    assert pm.color_count() == 40624

def test_memoryview():
    pm = fitz.Pixmap(imgfile)
    samples = pm.samples_mv
    assert isinstance( samples, memoryview)
    print( f'samples={samples} samples.itemsize={samples.itemsize} samples.nbytes={samples.nbytes} samples.ndim={samples.ndim} samples.shape={samples.shape} samples.strides={samples.strides}')
    assert samples.itemsize == 1
    assert samples.nbytes == 659817
    assert samples.ndim == 1
    assert samples.shape == (659817,)
    assert samples.strides == (1,)
    
    color = pm.pixel( 100, 100)
    print( f'color={color}')
    assert color == (83, 66, 40)

def test_samples_ptr():
    pm = fitz.Pixmap(imgfile)
    samples = pm.samples_ptr
    print( f'samples={samples}')
    assert isinstance( samples, int)

def test_2369():

    width, height = 13, 37
    image = fitz.Pixmap(fitz.csGRAY, width, height, b"\x00" * (width * height), False)

    with fitz.Document(stream=image.tobytes(output="pam"), filetype="pam") as doc:
        test_pdf_bytes = doc.convert_to_pdf()
    
    with fitz.Document(stream=test_pdf_bytes) as doc:
        page = doc[0]
        img_xref = page.get_images()[0][0]
        img = doc.extract_image(img_xref)
        img_bytes = img["image"]
        fitz.Pixmap(img_bytes)

def test_page_idx_int():
    doc = fitz.open(pdf)
    with pytest.raises(AssertionError):
        doc["0"]
    assert doc[0]
    assert doc[(0,0)]

def test_fz_write_pixmap_as_jpeg():
    width, height = 13, 37
    image = fitz.Pixmap(fitz.csGRAY, width, height, b"\x00" * (width * height), False)

    with fitz.Document(stream=image.tobytes(output="jpeg"), filetype="jpeg") as doc:
        test_pdf_bytes = doc.convert_to_pdf()

def test_3020():
    pm = fitz.Pixmap(imgfile)
    pm2 = fitz.Pixmap(pm, 20, 30, None)
    pm3 = fitz.Pixmap(fitz.csGRAY, pm)
    pm4 = fitz.Pixmap(pm, pm3)

def test_3050():
    '''
    This is known to fail if MuPDF is built without it's default third-party
    libraries, e.g. in Linux system installs.
    '''
    pdf_file = fitz.open(pdf)
    for page_no, page in enumerate(pdf_file):
        zoom_x = 4.0
        zoom_y = 4.0
        matrix = fitz.Matrix(zoom_x, zoom_y)
        pix = page.get_pixmap(matrix=matrix)
        digest0 = pix.digest
        print(f'{pix.width=} {pix.height=}')
        def product(x, y):
            for yy in y:
                for xx in x:
                    yield (xx, yy)
        n = 0
        # We use a small subset of the image because non-optimised rebase gets
        # very slow.
        for pos in product(range(100), range(100)):
            if sum(pix.pixel(pos[0], pos[1])) >= 600:
                n += 1
                pix.set_pixel(pos[0], pos[1], (255, 255, 255))
        digest1 = pix.digest
        print(f'{page_no=} {n=} {digest0=} {digest1=}')
        digest_expected = b'\xd7x\x94_\x98\xa1<-/\xf3\xf9\x04\xec#\xaa\xee'
        pix.save(os.path.abspath(f'{__file__}/../../tests/test_3050_out.png'))
        assert digest1 != digest0
        assert digest1 == digest_expected

def test_3058():
    doc = fitz.Document(os.path.abspath(f'{__file__}/../../tests/resources/test_3058.pdf'))
    images = doc[0].get_images(full=True)
    pix = fitz.Pixmap(doc, 17)
    
    # First bug was that `pix.colorspace` was DeviceRGB.
    assert str(pix.colorspace) == 'Colorspace(CS_CMYK) - DeviceCMYK'
    
    pix = fitz.Pixmap(fitz.csRGB, pix)
    assert str(pix.colorspace) == 'Colorspace(CS_RGB) - DeviceRGB'
    
    # Second bug was that the image was converted to RGB via greyscale proofing
    # color space, so image contained only shades of grey. This compressed
    # easily to a .png file, so we crudely check the bug is fixed by looking at
    # size of .png file.
    path = os.path.abspath(f'{__file__}/../../tests/test_3058_out.png')
    pix.save(path)
    s = os.path.getsize(path)
    assert 1800000 < s < 2600000, f'Unexpected size of {path}: {s}'

def test_3072():
    if fitz.mupdf_version_tuple < (1, 23, 10):
        print(f'test_3072(): Not running because known to hang on MuPDF < 1.23.10.')
        return
    
    path = os.path.abspath(f'{__file__}/../../tests/resources/test_3072.pdf')
    out = os.path.abspath(f'{__file__}/../../tests')
    
    doc = fitz.open(path)
    page_48 = doc[0]
    bbox = [147, 300, 447, 699]
    rect = fitz.Rect(*bbox)
    zoom = fitz.Matrix(3, 3)
    pix = page_48.get_pixmap(clip=rect, matrix=zoom)
    image_save_path = f'{out}/1.jpg'
    pix.save(image_save_path, jpg_quality=95)
    
    doc = fitz.open(path)
    page_49 = doc[1]
    bbox = [147, 543, 447, 768]
    rect = fitz.Rect(*bbox)
    zoom = fitz.Matrix(3, 3)
    pix = page_49.get_pixmap(clip=rect, matrix=zoom)
    image_save_path = f'{out}/2.jpg'
    pix.save(image_save_path, jpg_quality=95)

def test_3134():
    doc = fitz.Document()
    page = doc.new_page()
    page.get_pixmap(clip=fitz.Rect(0, 0, 100, 100)).save("test_3134_rect.jpg")
    page.get_pixmap(clip=fitz.IRect(0, 0, 100, 100)).save("test_3134_irect.jpg")
    stat_rect = os.stat('test_3134_rect.jpg')
    stat_irect = os.stat('test_3134_irect.jpg')
    print(f' {stat_rect=}')
    print(f'{stat_irect=}')
    assert stat_rect.st_size == stat_irect.st_size
    
def test_3177():
    path = os.path.abspath(f'{__file__}/../../tests/resources/img-transparent.png')
    pixmap = fitz.Pixmap(path)
    pixmap2 = fitz.Pixmap(None, pixmap)
