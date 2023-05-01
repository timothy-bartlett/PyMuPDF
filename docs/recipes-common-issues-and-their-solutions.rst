.. include:: header.rst

.. _RecipesCommonIssuesAndTheirSolutions:

==========================================
Common Issues and their Solutions
==========================================

How To Dynamically Clean Up Corrupt :title:`PDFs`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This shows a potential use of :title:`PyMuPDF` with another Python PDF library (the excellent pure Python package `pdfrw <https://pypi.python.org/pypi/pdfrw>`_ is used here as an example).

If a clean, non-corrupt / decompressed PDF is needed, one could dynamically invoke PyMuPDF to recover from many problems like so::

 import sys
 from io import BytesIO
 from pdfrw import PdfReader
 import fitz

 #---------------------------------------
 # 'Tolerant' PDF reader
 #---------------------------------------
 def reader(fname, password = None):
     idata = open(fname, "rb").read()  # read the PDF into memory and
     ibuffer = BytesIO(idata)  # convert to stream
     if password is None:
         try:
             return PdfReader(ibuffer)  # if this works: fine!
         except:
             pass

     # either we need a password or it is a problem-PDF
     # create a repaired / decompressed / decrypted version
     doc = fitz.open("pdf", ibuffer)
     if password is not None:  # decrypt if password provided
         rc = doc.authenticate(password)
         if not rc > 0:
             raise ValueError("wrong password")
     c = doc.tobytes(garbage=3, deflate=True)
     del doc  # close & delete doc
     return PdfReader(BytesIO(c))  # let pdfrw retry
 #---------------------------------------
 # Main program
 #---------------------------------------
 pdf = reader("pymupdf.pdf", password = None) # include a password if necessary
 print pdf.Info
 # do further processing

With the command line utility *pdftk* (`available <https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/>`_ for Windows only, but reported to also run under `Wine <https://www.winehq.org/>`_) a similar result can be achieved, see `here <http://www.overthere.co.uk/2013/07/22/improving-pypdf2-with-pdftk/>`_. However, you must invoke it as a separate process via *subprocess.Popen*, using stdin and stdout as communication vehicles.



How to Convert Any Document to :title:`PDF`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is a script that converts any :title:`PyMuPDF` supported document to a :title:`PDF`. These include XPS, EPUB, FB2, CBZ and all image formats, including multi-page TIFF images.

It features maintaining any metadata, table of contents and links contained in the source document::

    """
    Demo script: Convert input file to a PDF
    -----------------------------------------
    Intended for multi-page input files like XPS, EPUB etc.

    Features:
    ---------
    Recovery of table of contents and links of input file.
    While this works well for bookmarks (outlines, table of contents),
    links will only work if they are not of type "LINK_NAMED".
    This link type is skipped by the script.

    For XPS and EPUB input, internal links however **are** of type "LINK_NAMED".
    Base library MuPDF does not resolve them to page numbers.

    So, for anyone expert enough to know the internal structure of these
    document types, can further interpret and resolve these link types.

    Dependencies
    --------------
    PyMuPDF v1.14.0+
    """
    import sys
    import fitz
    if not (list(map(int, fitz.VersionBind.split("."))) >= [1,14,0]):
        raise SystemExit("need PyMuPDF v1.14.0+")
    fn = sys.argv[1]

    print("Converting '%s' to '%s.pdf'" % (fn, fn))

    doc = fitz.open(fn)

    b = doc.convert_to_pdf()  # convert to pdf
    pdf = fitz.open("pdf", b)  # open as pdf

    toc= doc.het_toc()  # table of contents of input
    pdf.set_toc(toc)  # simply set it for output
    meta = doc.metadata  # read and set metadata
    if not meta["producer"]:
        meta["producer"] = "PyMuPDF v" + fitz.VersionBind

    if not meta["creator"]:
        meta["creator"] = "PyMuPDF PDF converter"
    meta["modDate"] = fitz.get_pdf_now()
    meta["creationDate"] = meta["modDate"]
    pdf.set_metadata(meta)

    # now process the links
    link_cnti = 0
    link_skip = 0
    for pinput in doc:  # iterate through input pages
        links = pinput.get_links()  # get list of links
        link_cnti += len(links)  # count how many
        pout = pdf[pinput.number]  # read corresp. output page
        for l in links:  # iterate though the links
            if l["kind"] == fitz.LINK_NAMED:  # we do not handle named links
                print("named link page", pinput.number, l)
                link_skip += 1  # count them
                continue
            pout.insert_link(l)  # simply output the others

    # save the conversion result
    pdf.save(fn + ".pdf", garbage=4, deflate=True)
    # say how many named links we skipped
    if link_cnti > 0:
        print("Skipped %i named links of a total of %i in input." % (link_skip, link_cnti))



How to Deal with Messages Issued by :title:`MuPDF`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since :title:`PyMuPDF` v1.16.0, **error messages** issued by the underlying :title:`MuPDF` library are being redirected to the Python standard device *sys.stderr*. So you can handle them like any other output going to this devices.

In addition, these messages go to the internal buffer together with any :title:`MuPDF` warnings -- see below.

We always prefix these messages with an identifying string *"mupdf:"*.
If you prefer to not see recoverable MuPDF errors at all, issue the command `fitz.TOOLS.mupdf_display_errors(False)`.

MuPDF warnings continue to be stored in an internal buffer and can be viewed using :meth:`Tools.mupdf_warnings`.

Please note that MuPDF errors may or may not lead to Python exceptions. In other words, you may see error messages from which MuPDF can recover and continue processing.

Example output for a **recoverable error**. We are opening a damaged PDF, but MuPDF is able to repair it and gives us a little information on what happened. Then we illustrate how to find out whether the document can later be saved incrementally. Checking the :attr:`Document.is_dirty` attribute at this point also indicates that during `fitz.open` the document had to be repaired:

>>> import fitz
>>> doc = fitz.open("damaged-file.pdf")  # leads to a sys.stderr message:
mupdf: cannot find startxref
>>> print(fitz.TOOLS.mupdf_warnings())  # check if there is more info:
cannot find startxref
trying to repair broken xref
repairing PDF document
object missing 'endobj' token
>>> doc.can_save_incrementally()  # this is to be expected:
False
>>> # the following indicates whether there are updates so far
>>> # this is the case because of the repair actions:
>>> doc.is_dirty
True
>>> # the document has nevertheless been created:
>>> doc
fitz.Document('damaged-file.pdf')
>>> # we now know that any save must occur to a new file

Example output for an **unrecoverable error**:

>>> import fitz
>>> doc = fitz.open("does-not-exist.pdf")
mupdf: cannot open does-not-exist.pdf: No such file or directory
Traceback (most recent call last):
  File "<pyshell#1>", line 1, in <module>
    doc = fitz.open("does-not-exist.pdf")
  File "C:\Users\Jorj\AppData\Local\Programs\Python\Python37\lib\site-packages\fitz\fitz.py", line 2200, in __init__
    _fitz.Document_swiginit(self, _fitz.new_Document(filename, stream, filetype, rect, width, height, fontsize))
RuntimeError: cannot open does-not-exist.pdf: No such file or directory
>>>



Changing Annotations: Unexpected Behaviour
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Problem
^^^^^^^^^
There are two scenarios:

1. **Updating** an annotation with PyMuPDF which was created by some other software.
2. **Creating** an annotation with PyMuPDF and later changing it with some other software.

In both cases you may experience unintended changes, like a different annotation icon or text font, the fill color or line dashing have disappeared, line end symbols have changed their size or even have disappeared too, etc.

Cause
^^^^^^
Annotation maintenance is handled differently by each PDF maintenance application. Some annotation types may not be supported, or not be supported fully or some details may be handled in a different way than in another application. **There is no standard.**

Almost always a PDF application also comes with its own icons (file attachments, sticky notes and stamps) and its own set of supported text fonts. For example:

* (Py-) MuPDF only supports these 5 basic fonts for 'FreeText' annotations: Helvetica, Times-Roman, Courier, ZapfDingbats and Symbol -- no italics / no bold variations. When changing a 'FreeText' annotation created by some other app, its font will probably not be recognized nor accepted and be replaced by Helvetica.

* PyMuPDF supports all PDF text markers (highlight, underline, strikeout, squiggly), but these types cannot be updated with Adobe Acrobat Reader.

In most cases there also exists limited support for line dashing which causes existing dashes to be replaced by straight lines. For example:

* PyMuPDF fully supports all line dashing forms, while other viewers only accept a limited subset.


Solutions
^^^^^^^^^^
Unfortunately there is not much you can do in most of these cases.

1. Stay with the same software for **creating and changing** an annotation.
2. When using PyMuPDF to change an "alien" annotation, try to **avoid** :meth:`Annot.update`. The following methods **can be used without it,** so that the original appearance should be maintained:

  * :meth:`Annot.set_rect` (location changes)
  * :meth:`Annot.set_flags` (annotation behaviour)
  * :meth:`Annot.set_info` (meta information, except changes to *content*)
  * :meth:`Annot.set_popup` (create popup or change its rect)
  * :meth:`Annot.set_optional_content` (add / remove reference to optional content information)
  * :meth:`Annot.set_open`
  * :meth:`Annot.update_file` (file attachment changes)

Misplaced Item Insertions on PDF Pages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Problem
^^^^^^^^^

You inserted an item (like an image, an annotation or some text) on an existing PDF page, but later you find it being placed at a different location than intended. For example an image should be inserted at the top, but it unexpectedly appears near the bottom of the page.

Cause
^^^^^^

The creator of the PDF has established a non-standard page geometry without keeping it "local" (as they should!). Most commonly, the PDF standard point (0,0) at *bottom-left* has been changed to the *top-left* point. So top and bottom are reversed -- causing your insertion to be misplaced.

The visible image of a PDF page is controlled by commands coded in a special mini-language. For an overview of this language consult "Operator Summary" on pp. 643 of the :ref:`AdobeManual`. These commands are stored in :data:`contents` objects as strings (*bytes* in PyMuPDF).

There are commands in that language, which change the coordinate system of the page for all the following commands. In order to limit the scope of such commands to "local", they must be wrapped by the command pair *q* ("save graphics state", or "stack") and *Q* ("restore graphics state", or "unstack").

.. highlight:: text

So the PDF creator did this::

    stream
    1 0 0 -1 0 792 cm    % <=== change of coordinate system:
    ...                  % letter page, top / bottom reversed
    ...                  % remains active beyond these lines
    endstream

where they should have done this::

    stream
    q                    % put the following in a stack
    1 0 0 -1 0 792 cm    % <=== scope of this is limited by Q command
    ...                  % here, a different geometry exists
    Q                    % after this line, geometry of outer scope prevails
    endstream

.. note::

   * In the mini-language's syntax, spaces and line breaks are equally accepted token delimiters.
   * Multiple consecutive delimiters are treated as one.
   * Keywords "stream" and "endstream" are inserted automatically -- not by the programmer.

.. highlight:: python

Solutions
^^^^^^^^^^

Since v1.16.0, there is the property :attr:`Page.is_wrapped`, which lets you check whether a page's contents are wrapped in that string pair.

If it is *False* or if you want to be on the safe side, pick one of the following:

1. The easiest way: in your script, do a :meth:`Page.clean_contents` before you do your first item insertion.
2. Pre-process your PDF with the MuPDF command line utility *mutool clean -c ...* and work with its output file instead.
3. Directly wrap the page's :data:`contents` with the stacking commands before you do your first item insertion.

**Solutions 1. and 2.** use the same technical basis and **do a lot more** than what is required in this context: they also clean up other inconsistencies or redundancies that may exist, multiple */Contents* objects will be concatenated into one, and much more.

.. note:: For **incremental saves,** solution 1. has an unpleasant implication: it will bloat the update delta, because it changes so many things and, in addition, stores the **cleaned contents uncompressed**. So, if you use :meth:`Page.clean_contents` you should consider **saving to a new file** with (at least) *garbage=3* and *deflate=True*.

**Solution 3.** is completely under your control and only does the minimum corrective action. There is a handy low-level utility function which you can use for this. Suggested procedure:

* **Prepend** the missing stacking command by executing *fitz.TOOLS._insert_contents(page, b"q\n", False)*.
* **Append** an unstacking command by executing *fitz.TOOLS._insert_contents(page, b"\nQ", True)*.
* Alternatively, just use :meth:`Page._wrap_contents`, which executes the previous two functions.

.. note:: If small incremental update deltas are a concern, this approach is the most effective. Other contents objects are not touched. The utility method creates two new PDF :data:`stream` objects and inserts them before, resp. after the page's other :data:`contents`. We therefore recommend the following snippet to get this situation under control:

    >>> if not page.is_wrapped:
            page.wrap_contents()
    >>> # start inserting text, images or annotations here


Missing or Unreadable Extracted Text
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Fairly often, text extraction does not work text as you would expect: text may be missing, or may not appear in the reading sequence visible on your screen, or contain garbled characters (like a ? or a "TOFU" symbol), etc. This can be caused by a number of different problems.

Problem: no text is extracted
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Your PDF viewer does display text, but you cannot select it with your cursor, and text extraction delivers nothing.

Cause
^^^^^^
1. You may be looking at an image embedded in the PDF page (e.g. a scanned PDF).
2. The PDF creator used no font, but **simulated** text by painting it, using little lines and curves. E.g. a capital "D" could be painted by a line "|" and a left-open semi-circle, an "o" by an ellipse, and so on.

Solution
^^^^^^^^^^
Use an OCR software like `OCRmyPDF <https://pypi.org/project/ocrmypdf/>`_ to insert a hidden text layer underneath the visible page. The resulting PDF should behave as expected.

Problem: unreadable text
^^^^^^^^^^^^^^^^^^^^^^^^
Text extraction does not deliver the text in readable order, duplicates some text, or is otherwise garbled.

Cause
^^^^^^
1. The single characters are readable as such (no "<?>" symbols), but the sequence in which the text is **coded in the file** deviates from the reading order. The motivation behind may be technical or protection of data against unwanted copies.
2. Many "<?>" symbols occur, indicating MuPDF could not interpret these characters. The font may indeed be unsupported by MuPDF, or the PDF creator may haved used a font that displays readable text, but on purpose obfuscates the originating corresponding unicode character.

Solution
^^^^^^^^
1. Use layout preserving text extraction: `python -m fitz gettext file.pdf`.
2. If other text extraction tools also don't work, then the only solution again is OCRing the page.

.. include:: footer.rst
