#!/usr/bin/python
# -*- coding: utf-8 -*-
from . import fitz
import math

'''
The following is a collection of commodity functions to simplify the use of PyMupdf.
'''
#==============================================================================
# A function for searching string occurrences on a page.
#==============================================================================
#def searchFor(page, text, hit_max = 16):
def searchFor(*arg, **kw):
    '''searchFor(text, hit_max=16)\nSearch for a string on a page. Parameters:\ntext: string to be searched for\nhit_max: maximum hits.\nOutput will be a list of rectangles, each of which surrounds a found occurrence.
    '''
    page = arg[0]
    text = arg[1]
    if "hit_max" in kw:
        hit_max = kw["hit_max"]
    else:
        hit_max = 16

    if not getattr(page, "parent", None):
        raise ValueError("invalid page object provided to searchFor")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")

    # reuse an existing fitz.DisplayList for this page if possible
    dl = getattr(page, "DisplayList", None)      # reuse DisplayList from before
    if not dl:
        dl = fitz.DisplayList()                  # create DisplayList
        dv = fitz.Device(dl)                     # create DisplayList device
        page.run(dv, fitz.Identity)              # run page through it
        page.DisplayList = dl                    # save DisplayList pointer

    # reuse an existing fitz.TextPage for this page if possible
    tp = getattr(page, "TextPage", None)         # reuse TextPage from before
    if not tp:
        ts = fitz.TextSheet()                    # create TextSheet
        tp = fitz.TextPage()                     # create TextPage
        rect = page.bound()                      # the page's rectangle
        dv = fitz.Device(ts, tp)                 # create device
        dl.run(dv, fitz.Identity, rect)          # run the page
        page.TextPage = tp                       # save TextPage pointer

    # return list of hitting reactangles
    return tp.search(text, hit_max = hit_max)

#==============================================================================
# A function for extracting a page's text.
#==============================================================================
#def getText(page, output = "text"):
def getText(*arg, **kw):
    '''getText(output='text')\nExtracts a PDF page's text. Parameters:\noutput option: text, html, json or xml.\nOutput will be a string representing the output of the TextPage extraction methods extractText, extractHTML, extractJSON, or etractXML respectively. Default and silent choice in case of spec errors is "text".
    '''
    # determine parameters. Using generalized arguments, so we can become a
    # method of the Page class
    page = arg[0]                                # arg[0] = self when Page method
    if "output" in kw:
        output = kw["output"]
    else:
        output = "text"
    if not getattr(page, "parent", None):
        raise ValueError("invalid page object provided to getText")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")

    # reuse an existing fitz.DisplayList for this page if possible
    dl = getattr(page, "DisplayList", None)      # reuse DisplayList from before
    if not dl:
        dl = fitz.DisplayList()                  # create DisplayList
        dv = fitz.Device(dl)                     # create DisplayList device
        page.run(dv, fitz.Identity)              # run page through it
        page.DisplayList = dl                    # save DisplayList pointer

    # reuse an existing fitz.TextPage for this page if possible
    tp = getattr(page, "TextPage", None)         # reuse TextPage from before
    if not tp:
        ts = fitz.TextSheet()                    # create TextSheet
        tp = fitz.TextPage()                     # create TextPage
        rect = page.bound()                      # the page's rectangle
        dv = fitz.Device(ts, tp)                 # create device
        dl.run(dv, fitz.Identity, rect)          # run the page
        page.TextPage = tp                       # save TextPage pointer

    # return requested text format
    if output.lower() == "json":
        return tp.extractJSON()
    elif output.lower() == "html":
        return tp.extractHTML()
    elif output.lower() == "xml":
        return tp.extractXML()
    return tp.extractText()

#==============================================================================
# A function for extracting a page's text.
#==============================================================================
#def getPageText(pno, output = "text"):
def getPageText(*arg, **kw):
    '''getPageText(pno, output='text')\nExtracts a PDF page's text by page number.\nParameters:\npno: page number\noutput option: text, html, json or xml.\nOutput will be a string representing the output of the TextPage extraction methods extractText, extractHTML, extractJSON, or etractXML respectively. Default and silent choice in case of spec errors is "text".
    '''
    # determine parameters. Using generics, so we can become a
    # method of the Document class
    if len(arg) != 2:
        raise ValueError("requiring 2 pos. arguments, %s given" % (len(arg),))
    doc = arg[0]                       # arg[0] = self when Document method
    pno = int(arg[1])                  # page number
    if "output" in kw:
        output = kw["output"]
    else:
        output = "text"

    if doc.isClosed:
        raise ValueError("page operation on closed document")
    if pno < 0 or pno > doc.pageCount:
        raise ValueError("page number not in range 0 to %s" % (doc.pageCount,))

    page = doc.loadPage(pno)

    # reuse an existing fitz.DisplayList for this page if possible
    dl = fitz.DisplayList()                  # create DisplayList
    dv = fitz.Device(dl)                     # create DisplayList device
    page.run(dv, fitz.Identity)              # run page through it
    ts = fitz.TextSheet()                    # create TextSheet
    tp = fitz.TextPage()                     # create TextPage
    rect = page.bound()                      # the page's rectangle
    dv = fitz.Device(ts, tp)                 # create device
    dl.run(dv, fitz.Identity, rect)          # run the page

    # return requested text format
    if output.lower() == "json":
        return tp.extractJSON()
    elif output.lower() == "html":
        return tp.extractHTML()
    elif output.lower() == "xml":
        return tp.extractXML()
    return tp.extractText()

#==============================================================================
# A function for rendering a page's image.
# Requires a page object.
#==============================================================================
#def getPixmap(matrix = fitz.Identity, colorspace = "RGB"):
def getPixmap(*arg, **kw):
    '''getPixmap(matrix=fitz.Identity, colorspace='rgb')\nCreates a fitz.Pixmap of a PDF page. Parameters:\nmatrix: a fitz.Matrix instance to specify required transformations. Defaults to fitz.Identity (no transformation).\ncolorspace: text string to specify required colour space (RGB, CMYK or GRAY). Default and misspelling choice is "RGB".
    '''
    # get parameters
    if len(arg) != 1:
        raise ValueError("requiring 1 pos. argument, %s given" % (len(arg),))
    page = arg[0]
    if "matrix" in kw:
        matrix = kw["matrix"]
    else:
        matrix = fitz.Identity
    if "colorspace" in kw:
        colorspace = kw["colorspace"]
    else:
        colorspace = "RGB"

    # check if called with a valid page
    if not getattr(page, "parent", None):
        raise ValueError("invalid page object provided to getPixmap")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")

    # determine required colorspace
    if colorspace.upper() == "GRAY":
        cs = fitz.csGRAY
    elif colorspace.upper() == "CMYK":
        cs = fitz.csCMYK
    else:
        cs = fitz.csRGB

    # reuse an existing fitz.DisplayList for this page if possible
    dl = getattr(page, "DisplayList", None)      # reuse DisplayList from before
    if not dl:
        dl = fitz.DisplayList()                  # create DisplayList
        dv = fitz.Device(dl)                     # create DisplayList device
        page.run(dv, fitz.Identity)              # run page through it
        page.DisplayList = dl                    # save DisplayList pointer

    page.TextPage = None                         # force fresh one next time

    r = page.bound().transform(matrix)           # scale page boundaries
    ir = r.round()                               # integer rectangle of it
    pix = fitz.Pixmap(cs, ir)                    # create an empty pixmap
    pix.clearWith(255)                           # clear it with color "white"
    dv = fitz.Device(pix)                        # create a "draw" device

    dl.run(dv, matrix, r)                        # render the page
    return pix

#==============================================================================
# A function for rendering a page by its number
#==============================================================================
#def getPagePixmap(doc, pno, matrix = fitz.Identity, colorspace = "RGB"):
def getPagePixmap(*arg, **kw):
    '''getPagePixmap(pno, matrix=fitz.Identity, colorspace="rgb")\nCreates a fitz.Pixmap object for a PDF page number. Parameters:\npno: page number (int)\nmatrix: a fitz.Matrix instance to specify required transformations. Defaults to fitz.Identity (no transformation).\ncolorspace: text string to specify the required colour space (RGB, CMYK or GRAY). Default and misspelling choice is "RGB".
    '''
    # get parameters
    doc = arg[0]
    pno = int(arg[1])
    if "matrix" in kw:
        matrix = kw["matrix"]
    else:
        matrix = fitz.Identity
    if "colorspace" in kw:
        colorspace = kw["colorspace"]
    else:
        colorspace = "RGB"

    # check if called with a valid document and page number
    if pno < 0 or pno > doc.pageCount:
        raise ValueError("page number not in range 0 to %s" % (doc.pageCount,))
    if doc.isClosed:
        raise ValueError("page operation on closed document")
    page = doc.loadPage(pno)

    # determine required colorspace
    if colorspace.upper() == "GRAY":
        cs = fitz.csGRAY
    elif colorspace.upper() == "CMYK":
        cs = fitz.csCMYK
    else:
        cs = fitz.csRGB

    r = page.bound().transform(matrix)           # scale page boundaries
    ir = r.round()                               # integer rectangle of it
    pix = fitz.Pixmap(cs, ir)                    # create an empty pixmap
    pix.clearWith(255)                           # clear it with color "white"
    dv = fitz.Device(pix)                        # create a "draw" device

    page.run(dv, matrix)                         # render the page
    return pix

#==============================================================================
# A function to collect all links of a PDF page.
# Required is a page object previously created by the
# loadPage() method of a document.
#==============================================================================
#def getLinks(page):
def getLinks(*arg, **kw):
    '''getLinks()\nCreates a list of all links contained in a PDF page. Parameters: none\nThe returned list contains a Python dictionary for every link item found. Every dictionary contains the keys "type" and "kind" to specify the link type / kind. The presence of other keys depends on this kind - see PyMuPDF's ducmentation for details.'''
    # get parameters
    page = arg[0]

    # check whether called with a valid page
    if not getattr(page, "parent", None):
        raise ValueError("invalid page object provided to getLinks")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")
    ln = page.loadLinks()
    links = []
    while ln:
        nl = {"kind":ln.dest.kind, "from": [round(ln.rect.x0, 4), round(ln.rect.y0, 4), round(ln.rect.x1, 4), round(ln.rect.y1, 4)]}
        flags = bin(ln.dest.flags)[2:].rjust(8, "0")
        if flags[6:] == "11":
            nl["to"] = [round(ln.dest.lt.x, 4), round(ln.dest.lt.y, 4)]

        if ln.dest.kind == fitz.LINK_URI:
            nl["type"] = "uri"
            nl["uri"] =  ln.dest.uri

        elif ln.dest.kind == fitz.LINK_GOTO:
            nl["type"] = "goto"
            nl["page"] = ln.dest.page

        elif ln.dest.kind == fitz.LINK_GOTOR:
            nl["type"] = "gotor"
            nl["file"] = ln.dest.fileSpec
            nl["page"] = ln.dest.page

        elif ln.dest.kind == fitz.LINK_LAUNCH:
            nl["type"] = "launch"
            nl["file"] = ln.dest.fileSpec

        elif ln.dest.kind == fitz.LINK_NAMED:
            nl["type"] = "named"
            nl["name"] = ln.dest.named

        elif ln.dest.kind == fitz.LINK_NONE:
            nl["type"] = "none"
            nl["page"] = ln.dest.page

        else:
            pass
        links.append(nl)
        ln = ln.next
    return links

#==============================================================================
# A function to collect all bookmarks of a PDF document in the form of a table
# of contents.
#==============================================================================
#def GetToC(doc, simple = True):
def getToC(*arg, **kw):
    '''getToC(simple=True)\nCreates a table of contents for a given PDF document. Parameters:\nsimple: a boolean indicator to control the output\nOutput is a Python list, where each entry consists of outline level, title, page number and link destination (if simple = False). For details see PyMuPDF's documentation.'''
    # get parameters
    doc = arg[0]
    if "simple" in kw:
        simple = kw["simple"]
    else:
        simple = True

    def recurse(olItem, liste, lvl):
        '''Recursively follow the outline item chain and record item information in a list.'''
        while olItem:
            if olItem.title:
                title = olItem.title.decode("latin-1")
            else:
                title = u" "
            page = olItem.dest.page + 1
            if not simple:
                link = {"kind": olItem.dest.kind}
                flags = bin(olItem.dest.flags)[2:].rjust(8, "0")
                if flags[6:] == "11":       # valid target top-left coordinate
                    link["to"] = [round(olItem.dest.lt.x, 4), round(olItem.dest.lt.y, 4)]
                page = olItem.dest.page + 1
                if olItem.dest.kind == fitz.LINK_GOTO:
                    link["type"] = "goto"
                    link["page"] = olItem.dest.page

                elif olItem.dest.kind == fitz.LINK_GOTOR:
                    link["type"] = "gotor"
                    link["file"] = olItem.dest.fileSpec
                    link["page"] = olItem.dest.page

                elif olItem.dest.kind == fitz.LINK_LAUNCH:
                    link["type"] = "launch"
                    link["file"] = olItem.dest.fileSpec

                elif olItem.dest.kind == fitz.LINK_URI:
                    link["type"] = "uri"
                    link["uri"] = olItem.dest.uri

                elif olItem.dest.kind == fitz.LINK_NAMED:
                    link["type"] = "named"
                    link["name"] = olItem.dest.named

                elif olItem.dest.kind == fitz.LINK_NONE:
                    link["type"] = "none"
                    link["page"] = olItem.dest.page

                liste.append([lvl, title, page, link])
            else:
                liste.append([lvl, title, olItem.dest.page + 1])
            if olItem.down:
                liste = recurse(olItem.down, liste, lvl+1)
            olItem = olItem.next
        return liste

    # check if we are being called legally
    if not getattr(doc, "authenticate", None):
        raise ValueError("invalid document object provided to getToC")

    # if the Document object has no outline property, then method
    # initData() has not yet been invoked, i.e. it's still encrypted
    if hasattr(doc, "outline"):
        olItem = doc.outline
    else:
        raise ValueError("document invalid or still encrypted")
    if doc.isClosed:
        raise ValueError("operation on closed document")

    if not olItem: return []
    lvl = 1
    liste = []
    return recurse(olItem, liste, lvl)

#==============================================================================
# A function to determine a pixmap's IRect
#==============================================================================
#def getIRect(pixmap):
def getIRect(*arg, **kw):
    '''getIRect()\nReturns the IRect of a given Pixmap.'''
    # get parameters
    p = arg[0]
    return fitz.IRect(p.x, p.y, p.x + p.width, p.y + p.height)

#==============================================================================
# A function to determine a pixmap's Colorspace
#==============================================================================
#def getColorspace(pixmap):
def getColorspace(*arg, **kw):
    '''Returns the fitz.Colorspace of a given fitz.Pixmap.'''
    # get parameters
    p = arg[0]
    if p.n == 2:
        return fitz.csGRAY
    elif p.n == 4:
        return fitz.csRGB
    elif p.n == 5:
        return fitz.csCMYK
    else:
        raise ValueError("unsupported colorspace in pixmap")

def RectArea(rect, unit = "pt"):
    '''Calculates the area of a rectangle in points or square millimeters. Parameters:\nrect: a fitz.IRect or fitz.Rect\nunit: a string, 'pt' means points, "mm" means millimeters.\nreturns a float containing the area.
    '''
    if rect.x1 <= rect.x0 or rect.y1 <= rect.y0:
        return 0.0
    width = float(rect.x1 - rect.x0)
    height = float(rect.y1 - rect.y0)
    area = width * height
    if unit == "pt":
        return area
    else:
        # square mm = pt * (25.4/72)**2
        return area * 0.1244521605

def PointDistance(p1, p2, unit = "pt"):
    '''Calculates the distance between two points in points or millimeters. Parameters:\np1, p2: two fitz.Point objects\nunit: a string, 'pt' means points, "mm" means millimeters.\returns a float containing the distance.
    '''
    a = float(p2.x - p1.x)
    b = float(p2.y - p1.y)
    c = math.sqrt(a * a + b * b)
    if unit == "pt":
        return c
    else:
        return c * 25.4 / 72.0

#def writeImage(filename, output = "png", savealpha = False):
def writeImage(*arg, **kw):
    '''writeImage(filename, output="png", savealpha=False)\nSaves a pixmap to an image. Parameters:\nfilename: image filename\noutput: requested output format (one of png, pam, pnm, tga)\nsavealpha: whether to save the alpha channel.
    '''
    pix = arg[0]
    filename = arg[1]
    if "output" in kw:
        output = kw["output"]
    else:
        output = "png"

    if "savealpha" in kw:
        savealpha = kw["savealpha"]
    else:
        savealpha = False
    c_output = 0
    if output == "png":
        c_output = 1
        if not filename.lower().endswith(".png"):
            raise ValueError("output=png requires .png extension")
        if pix.n > 4:
            raise ValueError("colorspace not supported for png")
    elif output == "tga":
        c_output = 4
        if not filename.lower().endswith(".tga"):
            raise ValueError("output=tga requires .tga extension")
        if pix.n > 4:
            raise ValueError("colorspace not supported for tga")
    elif output == "pam":
        c_output = 3
        if not filename.lower().endswith(".pam"):
            raise ValueError("output=pam requires .pam extension")
    elif output == "pnm":
        c_output = 2
        if pix.n > 4:
            raise ValueError("colorspace not supported for pnm")
        if pix.n == 2:
            if not filename.lower().endswith((".pnm", ".pgm")):
                raise ValueError("colorspace requires pnm or pgm extensions")
        elif not filename.lower().endswith((".pnm", "ppm")):
            raise ValueError("colorspace requires pnm or ppm extensions")
    else:
        raise ValueError("invalid output parameter")

    rc = pix.writeIMG(filename, c_output, savealpha)

    return rc
