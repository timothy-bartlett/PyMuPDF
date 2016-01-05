from __future__ import absolute_import
from fitz.fitz import *

'''
The following is a collection of commodity functions to simplify the use of PyMupdf.
'''
#==============================================================================
# A function for searching string occurrences on a page.
#==============================================================================
#def SearchFor(page, text, hit_max = 16):
def SearchFor(*arg, **kw):
    '''Search for a string on a page.\nParameters:\npage: a page object created by loadPage() method\ntext: string to be searched for\nhit_max: maximum hits.\nOutput will be a list of rectangles, each of which surrounds a found occurrence.
    '''
    page = arg[0]
    text = arg[1]
    if "hit_max" in kw:
        hit_max = kw["hit_max"]
    else:
        hit_max = 16
        
    if not getattr(page, "parent", None):
        raise ValueError("invalid page object provided to SearchFor")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")

    # reuse an existing fitz.DisplayList for this page if possible
    try:
        dl = page.DisplayList                    # reuse DisplayList from before
    except:
        dl = fitz.DisplayList()                  # create DisplayList
        dv = fitz.Device(dl)                     # create DisplayList device
        page.run(dv, fitz.Identity)              # run page through it
        page.DisplayList = dl                    # save DisplayList pointer

    # reuse an existing fitz.TextPage for this page if possible
    try:
        tp = page.TextPage                       # reuse TextPage from before
    except:
        ts = fitz.TextSheet()                    # create TextSheet
        tp = fitz.TextPage()                     # create TextPage  
        rect = page.bound()                      # the page's rectangle
        dl.run(fitz.Device(ts, tp), fitz.Identity, rect)   # run the page
        page.TextPage = tp                       # save TextPage pointer
    
    # return list of hitting reactangles
    return tp.search(text, hit_max = hit_max)

#==============================================================================
# A generalized function for extracting a page's text.
# All that needs to be specified is a page object prviously created by the
# loadPage() method of a document.
#==============================================================================
#def GetText(page, output = "text"):
def GetText(*arg, **kw):
    '''Extracts a PDF page's text.\nParameters:\npage: object from a previous loadPage()\noutput option: text, html, json or xml.\nOutput will be a string representing the output of the TextPage extraction methods extractText, extractHTML, extractJSON, or etractXML respectively. Default and silent choice in case of spec errors is "text".
    '''
    page = arg[0]
    if "output" in kw:
        output = kw["output"]
    else:
        output = "text"
    if not getattr(page, "parent", None):
        raise ValueError("invalid page object provided to GetText")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")

    # reuse an existing fitz.DisplayList for this page if possible
    try:
        dl = page.DisplayList                    # reuse DisplayList from before
    except:
        dl = fitz.DisplayList()                  # create DisplayList
        dv = fitz.Device(dl)                     # create DisplayList device
        page.run(dv, fitz.Identity)              # run page through it
        page.DisplayList = dl                    # save DisplayList pointer

    # reuse an existing fitz.TextPage for this page if possible
    try:
        tp = page.TextPage                       # reuse TextPage from before
    except:
        ts = fitz.TextSheet()                    # create TextSheet
        tp = fitz.TextPage()                     # create TextPage  
        rect = page.bound()                      # the page's rectangle
        dl.run(fitz.Device(ts, tp), fitz.Identity, rect)   # run the page
        page.TextPage = tp                       # save TextPage pointer
    
    # return appropriate text for the page
    if output.lower() == "json":
        return tp.extractJSON()
    elif output.lower() == "html":
        return tp.extractHTML()
    elif output.lower() == "xml":
        return tp.extractXML()
    return tp.extractText()

#==============================================================================
# A generalized function for rendering a page's image.
# All that needs to be specified is a page object previously created by the
# loadPage() method of a document.
#==============================================================================
#def GetPixmap(page, matrix = fitz.Identity, colorspace = "RGB"):
def GetPixmap(*arg, **kw):
    '''Creates a fitz.Pixmap object for a PDF page.\nParameters:\npage: object from a previous loadPage()\nmatrix: a fitz.Matrix instance to specify required transformations. Defaults to fitz.Identity (no transformation).\ncolorspace: text string to specify the required colour space (RGB, CMYK or GRAY). Default and silent choice in case of spec errors is "RGB".
    '''
    # get parameters
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
        raise ValueError("invalid page object provided to GetPixmap")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")
    
    # determine required colorspace
    if colorspace.upper() == "GRAY":
        cs = fitz.CS_GRAY
    elif colorspace.upper() == "CMYK":
        cs = fitz.CS_CMYK
    else:
        cs = fitz.CS_RGB

    # reuse an existing fitz.DisplayList for this page if possible
    try:
        dl = page.DisplayList                    # reuse DisplayList from before
    except:
        dl = fitz.DisplayList()                  # create DisplayList
        dv = fitz.Device(dl)                     # create DisplayList device
        page.run(dv, fitz.Identity)              # run page through it
        page.DisplayList = dl                    # save DisplayList pointer

    if hasattr(page, "TextPage"):                # any TextPage now unusable
        del page.TextPage                        # force fresh one next time

    r = page.bound().transform(matrix)           # scale page boundaries
    ir = r.round()                               # integer rectangle of it
    pix = fitz.Pixmap(fitz.Colorspace(cs), ir)   # create an empty pixmap
    pix.clearWith(255)                           # clear it with color "white"
    dev = fitz.Device(pix)                       # create a "draw" device

    dl.run(dev, matrix, r)                       # render the page

    return pix

#==============================================================================
# A function to collect all links of a PDF page.
# All that needs to be specified is a page object previously created by the
# loadPage() method of a document.
#==============================================================================
#def GetLinks(page):
def GetLinks(*arg, **kw):
    '''Creates a list of all links contained in a PDF page.\nParameters:\npage: object from a previous loadPage().\nThe returned list contains a Python dictionary for every link item found. Every dictionary contains the key "type" to specify the link type. The presence of other keys depends on this type - see PyMuPDF's ducmentation for details.'''
    # get parameters
    page = arg[0]
    
    # check if called with a valid page
    if not getattr(page, "parent", None):
        raise ValueError("invalid page object provided to GetLinks")
    if page.parent.isClosed:
        raise ValueError("page operation on closed document")
    ln = page.loadLinks()
    links = []
    while ln:
        if ln.dest.kind == fitz.LINK_URI:
            nl = {"type":"uri", "kind":ln.dest.kind, "uri": ln.dest.uri}

        elif ln.dest.kind == fitz.LINK_GOTO:
            nl = {"type": "goto", "kind":ln.dest.kind, "page":ln.dest.page, "file":None}

        elif ln.dest.kind == fitz.LINK_GOTOR:
            nl = {"type": "gotor", "kind":ln.dest.kind, "file":ln.dest.fileSpec, "page": ln.dest.page}

        elif ln.dest.kind == fitz.LINK_LAUNCH:
            nl = {"type": "launch", "kind":ln.dest.kind, "file":ln.dest.fileSpec}

        elif ln.dest.kind == fitz.LINK_NAMED:
            nl = {"type": "named", "kind":ln.dest.kind, "name":ln.dest.named}

        elif ln.dest.kind == fitz.LINK_NONE:
            nl = {"type": "none", "kind":ln.dest.kind, "page":ln.dest.page, "file":None}

        else:
            pass
        links.append(nl)
        ln = ln.next
    return links

#==============================================================================
# A function to collect all bookmarks of a PDF document in the form of a table
# of contents. it is very similar to Document.getToC (or fitz.GetToC(doc)).
# The difference is an additional entry for each outline, which specifies
# any link destination information. For details what these are, see PyMuPDF's
# documentation.
#==============================================================================
#def GetToC(doc, simple = True):
def GetToC(*arg, **kw):
    '''Creates a table of contents for a given PDF document.\nParameters:\ndoc: a document object created with fitz.Document.\nsimple: a boolean indicator to control the output\nOutput is a Python list, where each entry consists of outline level, title, page number and link destination (if simple = False). For details see PyMuPDF's documentation.'''
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
                title = olItem.title.decode("utf-8")
            else:
                title = u" "
            page = olItem.dest.page + 1
            if not simple:
                link = {}
                page = olItem.dest.page + 1
                if olItem.dest.kind == fitz.LINK_GOTO:
                    link = {"type": "goto", "kind":olItem.dest.kind, "file": None,
                            "page": olItem.dest.page}

                elif olItem.dest.kind == fitz.LINK_GOTOR:
                    link = {"type": "gotor", "kind":olItem.dest.kind, "file":olItem.dest.fileSpec,
                            "page": olItem.dest.page}

                elif olItem.dest.kind == fitz.LINK_LAUNCH:
                    link = {"type": "launch", "kind":olItem.dest.kind, "file":olItem.dest.fileSpec}

                elif olItem.dest.kind == fitz.LINK_URI:
                    link = {"type":"uri", "kind":olItem.dest.kind, "uri": olItem.dest.uri}

                elif olItem.dest.kind == fitz.LINK_NAMED:
                    link = {"type": "named", "kind":olItem.dest.kind, "name":olItem.dest.named}

                elif olItem.dest.kind == fitz.LINK_NONE:
                    link = {"type": "none", "kind":olItem.dest.kind, "page":olItem.dest.page,
                            "file":olItem.dest.fileSpec}

                liste.append([lvl, title, page, link])
            else:
                liste.append([lvl, title, olItem.dest.page + 1])
            if olItem.down:
                liste = recurse(olItem.down, liste, lvl+1)
            olItem = olItem.next
        return liste

    # check if we are being called legally
    if not getattr(doc, "authenticate", None):
        raise ValueError("invalid document object provided to GetToC")

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

# connect functions to their respective fitz classes
fitz.Document.getToC = GetToC
fitz.Page.getLinks = GetLinks
fitz.Page.getPixmap = GetPixmap
fitz.Page.getText = GetText
fitz.Page.searchFor = SearchFor