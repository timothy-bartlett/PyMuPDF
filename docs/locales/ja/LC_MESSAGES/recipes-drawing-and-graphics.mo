Þ    #      4              L  O  M  	       §    ¼  «   Ã     o  a        ñ            _   5  O       å  u   ô  Ñ   j	  Ô   <
  F       X  Á   Ü  õ          U   !  g   w     ß    a  »   n  :   *  7   e       Ã   »  o     ¨   ï  Ä     Ñ   ]    /  ¥  Ì  X  r     Ë  (  ê  ð     '     f   ,       *   ©     Ô     ê  Ñ  z     L   v   `   $  ×   2  ü!    /#  ¤   Ä$    i%     o&  Ä   '  o   U(  w   Å(  ¨   =)  L  æ)    3+  Q   8,  h   ,  (   ó,  ý   -  ¯   .  Þ   Ê.  ó   ©/    0   A shape is always created as a **child of a page**, usually with an instruction like `shape = page.new_shape()`. The class defines numerous methods that perform drawing operations on the page's area. For example, `last_point = shape.draw_rect(rect)` draws a rectangle along the borders of a suitably defined `rect = pymupdf.Rect(...)`. As can be seen, there is a high congruence level with the :ref:`Shape` class. With one exception: For technical reasons `lineCap` is a tuple of 3 numbers here, whereas it is an integer in :ref:`Shape` (and in PDF). So we simply take the maximum value of that tuple. Drawing and Graphics Drawing commands (**vector graphics**) issued by a page can be extracted as a list of dictionaries. Interestingly, this is possible for :ref:`all supported document types<Supported_File_Types>` -- not just PDF: so you can use it for XPS, EPUB and others as well. Drawing graphics is as simple as calling the type of :meth:`Drawing Method <Page.draw_line>` you may want. You can draw graphics directly on pages or within shape objects. For example, to draw a circle:: Here is a comparison between input and output of an example page, created by the previous script: How to Delete Drawings How to Draw Graphics How to Extract Drawings If you import this script, you can also directly use its graphics as in the following example:: In fact, :meth:`Shape.finish` *defines* a group of preceding draw operations to form one -- potentially rather complex -- graphics object. |PyMuPDF| provides several predefined graphics in `shapes_and_symbols.py <https://github.com/pymupdf/PyMuPDF-Utilities/blob/master/shapes/shapes_and_symbols.py>`_ which demonstrate how this works. New in v1.18.0 PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript PDF files support elementary drawing operations as part of their syntax. These are **vector graphics** and include basic geometrical objects like lines, curves, circles, rectangles including specifying colors. Page definitions can be complex and include instructions for not showing / hiding certain areas to keep them invisible. Things like this are ignored by :meth:`Page.get_drawings` - it will always return all paths. Page method, :meth:`Page.get_drawings()` accesses draw commands and converts them into a list of Python dictionaries. Each dictionary -- called a "path" -- represents a separate drawing -- it may be simple like a single line, or a complex combination of lines and curves representing one of the shapes of the previous section. PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. See :meth:`Page.apply_redactions` for the parameter options which can be sent - you are able to apply deletion options to image, drawing and text objects which are bound by the annotation area. The *path* dictionary has been designed such that it can easily be used by the :ref:`Shape` class and its methods. Here is an example for a page with one path, that draws a red-bordered yellow circle inside rectangle `Rect(100, 100, 200, 200)`:: The :ref:`Shape` object can be used to combine multiple drawings that should receive common properties as specified by :meth:`Shape.finish`. The following code shows an example of deleting the first drawing found on the page:: The following is a code snippet which extracts the drawings of a page and re-draws them on a new page:: The reconstruction of graphics, like shown here, is not perfect. The following aspects will not be reproduced as of this version: The returned *last_point* **always** is the :ref:`Point` where drawing operation ended ("last point"). Every such elementary drawing requires a subsequent :meth:`Shape.finish` to "close" it, but there may be multiple drawings which have one common ``finish()`` method. The syntax for such operations is defined in "A Operator Summary" on page 643 of the :ref:`AdobeManual`. Specifying these operators for a PDF page happens in its :data:`contents` objects. Therefore please consider these terms as being synonymous! This documentation covers all versions up to |version|. This is the script's outcome: To delete drawings/vector graphics we must use a :ref:`Redaction Annotation <The_Basics_Redacting>` with the bounding box of the drawing and then **add and apply** a redaction to it to delete it. When the terms "Drawings" or "Graphics" are mentioned here we are referring to "Vector Graphics" or "Line Art". You can use the path list to make your own lists of e.g. all lines or all rectangles on the page and subselect them by criteria, like color or position on the page etc. You need (at least) 4 BÃ©zier curves (of 3rd order) to draw a circle with acceptable precision. See this `Wikipedia article <https://en.wikipedia.org/wiki/B%C3%A9zier_curve>`_ for some background. |PyMuPDF| implements a large part of the available features via its :ref:`Shape` class, which is comparable to notions like "canvas" in other packages (e.g. `reportlab <https://pypi.org/project/reportlab/>`_). Project-Id-Version: PyMuPDF 1.23.0rc1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2024-05-01 16:48+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Suzan Sanver <suzan.sanver@dijipiji.com>
Language: ja
Language-Team: ja <suzan.sanver@dijipiji.com>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.10.3
 ã·ã§ã¤ãã¯å¸¸ã«ãã¼ã¸ã®å­ã¨ãã¦ä½æãããéå¸¸ã¯ `shape = page.new_shape()` ã®ãããªå½ä»¤ã§è¡ãã¾ãããã®ã¯ã©ã¹ã¯ããã¼ã¸ã®é åã«æç»æä½ãå®è¡ããããã®å¤æ°ã®ã¡ã½ãããå®ç¾©ãã¦ãã¾ãããã¨ãã°ã `last_point = shape.draw_rect(rect)` ã¯ãé©åã«å®ç¾©ããã `rect = pymupdf.Rect(â¦)` ã®å¢çã«æ²¿ã£ã¦åè§å½¢ãæç»ãã¾ãã ãè¦§ã®éãã :ref:`Shape` ã¯ã©ã¹ã¨ã®é«ãä¸è´åº¦ãããã¾ãããã ã1ã¤ä¾å¤ãããã¾ããæè¡çãªçç±ãããããã§ã¯ `lineCap` ã¯3ã¤ã®æ°å­ã®ã¿ãã«ã§ããã :ref:`Shape` ã¯ã©ã¹ï¼ããã³PDFåï¼ã§ã¯æ´æ°ã§ãããã®ããããã®ã¿ãã«ã®æå¤§å¤ãåç´ã«åå¾ãã¾ãã æç»ã¨ã°ã©ãã£ãã¯ã¹ ãã¼ã¸ããçºè¡ãããæç»ã³ãã³ããæ½åºã§ãã¾ããèå³æ·±ããã¨ã«ãããã¯ãã¹ã¦ã® :ref:`ãµãã¼ãããã¦ãã <Supported_File_Types>` ãã­ã¥ã¡ã³ãã¿ã¤ãã«å¯¾ãã¦å¯è½ã§ã â PDFã ãã§ãªããXPSãEPUBãªã©ã«ãä½¿ç¨ã§ãã¾ãã ã°ã©ãã£ãã¯ã¹ãæç»ãããã¨ã¯ãå¿è¦ãª :meth:`æç»æ¹æ³ <Page.draw_line>` ã®ç¨®é¡ãå¼ã³åºãã ãã§ããã°ã©ãã£ãã¯ã¹ã¯ããã¼ã¸ä¸ã¾ãã¯å½¢ç¶ãªãã¸ã§ã¯ãåã«ç´æ¥æç»ã§ãã¾ãã ä¾ãã°ãåãæç»ããã«ã¯ï¼ ä»¥ä¸ã¯ãåã®ã¹ã¯ãªããã§ä½æãããä¾ã®ãã¼ã¸ã®å¥åã¨åºåã®æ¯è¼ã§ãã æç»ã®åé¤æ¹æ³ ã°ã©ãã£ãã¯ã¹ãæç»ããæ¹æ³ æç»ã®æ½åºæ¹æ³ ãã®ã¹ã¯ãªãããã¤ã³ãã¼ãããã¨ãæ¬¡ã®ä¾ã®ããã«ãã®ã°ã©ãã£ãã¯ã¹ãç´æ¥ä½¿ç¨ãããã¨ãã§ãã¾ã:: å®éã«ã¯ã :meth:`Shape.finish` ã¯ã1ã¤ã®ï¼æ½å¨çã«éå¸¸ã«è¤éãªï¼ã°ã©ãã£ãã¯ãªãã¸ã§ã¯ããå½¢æããããã®åã®æç»æä½ã®ã°ã«ã¼ããå®ç¾©ãã¾ããPyMuPDFã¯ããããã©ã®ããã«æ©è½ããããç¤ºã `shapes_and_symbols.py <https://github.com/pymupdf/PyMuPDF-Utilities/blob/master/shapes/shapes_and_symbols.py>`_ åã®ããã¤ãã®äºåå®ç¾©ãããã°ã©ãã£ãã¯ã¹ãæä¾ãã¦ãã¾ãã v1.18.0ã§æ°ç»å ´ PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript PDFãã¡ã¤ã«ã¯ããã®æ§æã®ä¸é¨ã¨ãã¦åºæ¬çãªæç»æä½ããµãã¼ããã¦ãã¾ãããããã¯**ãã¯ãã«ã°ã©ãã£ãã¯ã¹**ã§ãããç·ãæ²ç·ãåãé·æ¹å½¢ãªã©ã®åºæ¬çãªå¹¾ä½å­¦çãªãã¸ã§ã¯ããå«ã¿ãè²ã®æå®ãå¯è½ã§ãã ãã¼ã¸ã®å®ç¾©ã¯è¤éã«ãªãå¯è½æ§ããããç¹å®ã®é åãè¡¨ç¤ºããªã/éè¡¨ç¤ºã«ããããã®æç¤ºãå«ããã¨ãããã¾ãããããããã¨ã¯ã :meth:`Page.get_drawings` ã«ãã£ã¦ç¡è¦ããã¾ã â ãã®ã¡ã½ããã¯å¸¸ã«ãã¹ã¦ã®ãã¹ãè¿ãã¾ãã :ref:`Page` ã¡ã½ããã:meth:`Page.get_drawings()` ã¯æç»ã³ãã³ãã«ã¢ã¯ã»ã¹ããããããPythonã®è¾æ¸ã®ãªã¹ãã«å¤æãã¾ããåè¾æ¸ â ããã¹ãã¨å¼ã°ãã â ã¯åå¥ã®æç»ãè¡¨ãã¾ã â ããã¯åç´ãªåä¸ã®ç·ã§ããããåã®ã»ã¯ã·ã§ã³ã®å½¢ç¶ã®1ã¤ãè¡¨ãç·ã¨æ²ç·ã®è¤éãªçµã¿åããã§ããããããã¾ããã PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã :meth:`Page.apply_redactions` ã«ã¯éä¿¡ã§ãããã©ã¡ã¼ã¿ãªãã·ã§ã³ãããã¾ããã¢ããã¼ã·ã§ã³é åã«ãã£ã¦å¢çä»ããããã¤ã¡ã¼ã¸ãæç»ããã­ã¹ããªãã¸ã§ã¯ãã«åé¤ãªãã·ã§ã³ãé©ç¨ã§ãã¾ãã ãã¹ã®è¾æ¸ã¯ã :ref:`Shape` ã¯ã©ã¹ã¨ãã®ã¡ã½ããã§ç°¡åã«ä½¿ç¨ã§ããããã«è¨­è¨ããã¦ãã¾ããä»¥ä¸ã¯ã1ã¤ã®ãã¹ãæã¤ãã¼ã¸ã®ä¾ã§ããã®ãã¹ã¯ `Rect(100, 100, 200, 200)` ã®åå´ã«èµ¤ãå¢çç·ã®é»è²ãåãæç»ãã¾ã:: :ref:`Shape` ãªãã¸ã§ã¯ãã¯ã:meth:`Shape.finish` ã§æå®ãããå±éã®ãã­ããã£ãåãåãå¿è¦ãããè¤æ°ã®æç»ãçµã¿åãããããã«ä½¿ç¨ã§ãã¾ãã ä»¥ä¸ã®ã³ã¼ãã¯ããã¼ã¸ä¸ã§æåã«è¦ã¤ãã£ãæç»ãåé¤ããä¾ãç¤ºãã¦ãã¾ãï¼ ä»¥ä¸ã¯ããã¼ã¸ã®æç»ãæ½åºããããããæ°ãããã¼ã¸ã«åæç»ããã³ã¼ãã®æ­çã§ã:: ããã«ç¤ºããã¦ãããããªã°ã©ãã£ãã¯ã¹ã®åæ§ç¯ã¯å®ç§ã§ã¯ããã¾ãããæ¬¡ã®ç¹ã¯ããã®ãã¼ã¸ã§ã³ã§ã¯åç¾ããã¾ããï¼ è¿ãããlast_pointã¯å¸¸ã«æç»æä½ãçµäºãã :ref:`Point` ï¼ãæå¾ã®ãã¤ã³ããï¼ã§ãããã®ãããªåºæ¬çãªæç»ãã¨ã«ãããããéãããããã« :meth:`Shape.finish` ãå¿è¦ã§ããã1ã¤ã®å±éã®``finish()``ã¡ã½ãããæã¤è¤æ°ã®æç»ãããããããã¾ããã ãã®ãããªæä½ã®æ§æã¯ã:ref:`AdobeManual` ã®ãA Operator Summaryãã®ãã¼ã¸643ã§å®ç¾©ããã¦ãã¾ããPDFãã¼ã¸ã®ããã®ãããã®ãªãã¬ã¼ã¿ã¯ããã®åå®¹ (:data:`contents`)ãªãã¸ã§ã¯ãåã§æå®ããã¾ãã ãããã£ã¦ããããã®ç¨èªãåç¾©èªã¨ãã¦èãã¦ãã ããã ãã®ãã­ã¥ã¡ã³ãã¯ |version| ã¾ã§ã®ãã¹ã¦ã®ãã¼ã¸ã§ã³ãå¯¾è±¡ã¨ãã¦ãã¾ãã ãããã¹ã¯ãªããã®çµæã§ã: æç»ããã¯ãã«ã°ã©ãã£ãã¯ã¹ãåé¤ããã«ã¯ããã®æç»ã®å¢çããã¯ã¹ãæã¤ :ref:`èµ¤å­ã¢ããã¼ã·ã§ã³<The_Basics_Redacting>` ãä½¿ç¨ããããã«èµ¤å­ã **è¿½å ãã¦é©ç¨ãã** å¿è¦ãããã¾ãã ããã§ãDrawingsãããGraphicsãã¨ããç¨èªãè¨åããã¦ããå ´åãããã¯ããã¯ãã«ã°ã©ãã£ãã¯ã¹ãããç·ç»ããæãã¦ãã¾ãã ãã¹ã®ãªã¹ããä½¿ç¨ãã¦ããã¼ã¸ä¸ã®ãã¹ã¦ã®ç·ã¾ãã¯ãã¹ã¦ã®åè§å½¢ãªã©ã®ãªã¹ããä½æããè²ããã¼ã¸ä¸ã®ä½ç½®ãªã©ã®åºæºã§ãµãã»ã¬ã¯ããããã¨ãã§ãã¾ãã é©åãªç²¾åº¦ã§åãæç»ããã«ã¯ãï¼å°ãªãã¨ãï¼4ã¤ã®3æ¬¡ãã¸ã¨æ²ç·ãå¿è¦ã§ããèæ¯ã«ã¤ãã¦ã¯ããã® `Wikipediaã®è¨äº <https://en.wikipedia.org/wiki/B%C3%A9zier_curve>`_ ãåç§ãã¦ãã ããã PyMuPDFã¯ã :ref:`Shape` ã¯ã©ã¹ãä»ãã¦å©ç¨å¯è½ãªå¤ãã®æ©è½ãå®è£ãã¦ãããããã¯ä»ã®ããã±ã¼ã¸ï¼ä¾ï¼ `reportlab <https://pypi.org/project/reportlab/>`_ ãªã©ï¼ã®ãã­ã£ã³ãã¹ãã®ãããªæ¦å¿µã¨é¡ä¼¼ãã¦ãã¾ãã 