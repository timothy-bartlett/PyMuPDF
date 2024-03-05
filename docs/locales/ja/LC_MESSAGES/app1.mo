Þ    R      ¬              <  D   =  J     ?   Í  6     ?   D  ?     (   Ä  (   í  .     K  E  D    ¨  Ö	        @     G   a     ©  g   Ç  :   /     j     ô  &     ø   /  d   (            "        À  `  Ï     0  7  A  S   y  ~   Í  ¢   L     ï     o  D       Ô  Ú   ò  	   Í     ×  @   ó     4  y  ;  Ã  µ  u   y     ï  
   û                    ¦     Å     F  Æ   Ø      K   ¤  7   ð  Å   (   g   î     V!  L  î"  I   ;$     $  ^   $     ê$     w%     &     ®&     ¿&  B   Ë&     '  	   '  7   ''  &   _'  *   '     ±'     Á'     Ô'  +   è'  2   (     G(    ](  m   ú)  s   h*  e   Ü*  Y   B+  g   +  k   ,  :   p,  6   «,  8   â,  ½  -  ©  Ù.    0  Ã   2  ¿  T3  k   5  8   5     ¹5  b   X6  Ó   »6     7  $   7  $  Ä7     é8     i9     v9     9      9  Ì  ¸9     ;  ¨  ;  Z   >=  ½   =  ×   W>  ´   /?     ä?  ó  @     öA    B     C  $   "C  ^   GC     ¦C  î  ³C    ¢E  v   (H     H     µH  ¤   ÎH     sI     I  0   I  ¦   ÏI  »   vJ    2K    7L  g   @M  h   ¨M  	  N     O  O  °O  ½   R  V   ¾S     T  X   T  ¬   uT  ¼   "U  Ø   ßU  '   ¸V     àV     ÿV     W     ¦W  \   ³W  6   X  Z   GX     ¢X     ²X     ÂX  Q   ÒX  N   $Y  $   sY   **"json"** is handled exactly like **"dict"** and is hence left out. **"rawjson"** is handled exactly like **"rawdict"** and is hence left out. **base64** images, **span** level text, layout and font details **base64** images, **span** level text, no layout info **binary** images, **char** level text, layout and font details **binary** images, **span** level text, layout and font details **exclude** images from a "dict" output: **include** images in a "blocks" output: **search** refers to the text search function. :meth:`TextPage.extractDICT` (or *Page.get_text("dict", sort=False)*) output fully reflects the structure of a *TextPage* and provides image content and position detail (*bbox* -- boundary boxes in pixel units) for every block, line and span. Images are stored as *bytes* for DICT output and base64 encoded strings for JSON output. :meth:`TextPage.extractHTML` (or *Page.get_text("html")* output fully reflects the structure of the page's *TextPage* -- much like DICT / JSON below. This includes images, font information and text positions. If wrapped in HTML header and trailer code, it can readily be displayed by an internet browser. Our above example:: :meth:`TextPage.extractRAWDICT` (or *Page.get_text("rawdict", sort=False)*) is an **information superset of DICT** and takes the detail level one step deeper. It looks exactly like the above, except that the *"text"* items (*string*) in the spans are replaced by the list *"chars"*. Each *"chars"* entry is a character *dict*. For example, here is what you would see in place of item *"text": "Text in black color."* above:: :meth:`TextPage.extractXHTML` (or *Page.get_text("xhtml")*) is a variation of TEXT but in HTML format, containing the bare text and images ("semantic" output):: :ref:`TextPage` is one of (Py-) MuPDF's classes. It is normally created (and destroyed again) behind the curtain, when :ref:`Page` text extraction methods are used, but it is also available directly and can be used as a persistent object. Other than its name suggests, images may optionally also be part of a text page:: A **block** consists of either lines and their characters, or an image. A **line** consists of spans. A **span** consists of adjacent characters with identical font properties: name, size, flags and color. A **text page** consists of blocks (= roughly paragraphs). An "n/a" specification means a value of 0 and setting this bit never has any effect on the output (but an adverse effect on performance). An example output:: Appendix 1: Details on Text Extraction As mentioned: when excluding image extraction (last column), the relative speeds are changing drastically: except RAWDICT and XML, the other methods are almost equally fast, and RAWDICT requires 40% less execution time than the **now slowest XML**. As with simple text output above, the `sort` argument can be used as well to obtain a reading order. BLOCKS Comments Controlling Quality of HTML Output DICT (or JSON) Especially images have a **very significant** impact. Make sure to exclude them (via the *flags* parameter) whenever you do not need them. To process the below mentioned 2'700 total pages with default flags settings required 160 seconds across all extraction methods. When all images where excluded, less than 50% of that time (77 seconds) were needed. Example output:: For PDFs with a complex structure, images may not be positioned and / or sized correctly. This seems to be the case for rotated pages and pages, where the various possible page bbox variants do not coincide (e.g. *MediaBox != CropBox*). We do not know yet, how to address this -- we filed a bug at MuPDF's site. For a visualization of the dictionary structure have a look at :ref:`textpagedict`. Function :meth:`TextPage.extractBLOCKS` (or *Page.get_text("blocks")*) extracts a page's text blocks as a list of items like:: Function :meth:`TextPage.extractText` (or *Page.get_text("text")*) extracts a page's plain **text in original order** as specified by the creator of the document. Function :meth:`TextPage.extractWORDS` (or *Page.get_text("words")*) extracts a page's text **words** as a list of items like:: General structure of a TextPage HTML text contains references to the fonts used of the original document. If these are not known to the browser (a fat chance!), it will replace them with others; the results will probably look awkward. This issue varies greatly by browser -- on my Windows machine, MS Edge worked just fine, whereas Firefox looked horrible. Here is how this looks like:: If you are not interested in images when using an output variant which includes them by default, then by all means set the respective bit off: You will experience a better performance and much lower space requirements. Indicator Information of interest are Look at chapter **Appendix 1** for more performance information. Method New in v1.19.6: The default combinations in the following table are now available as Python constants: :data:`TEXTFLAGS_TEXT`, :data:`TEXTFLAGS_WORDS`, :data:`TEXTFLAGS_BLOCKS`, :data:`TEXTFLAGS_DICT`, :data:`TEXTFLAGS_RAWDICT`, :data:`TEXTFLAGS_HTML`, :data:`TEXTFLAGS_XHTML`, :data:`TEXTFLAGS_XML`, and :data:`TEXTFLAGS_SEARCH`. You can now easily modify a default flag, e.g. New in version 1.16.2: Method :meth:`Page.get_text` supports a keyword parameter *flags* *(int)* to control the amount and the quality of extracted data. The following table shows the defaults settings (flags parameter omitted or None) for each extraction variant. If you specify flags with a value other than *None*, be aware that you must set **all desired** options. A description of the respective bit settings can be found in :ref:`TextPreserve`. PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript Performance Plain Text PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. RAWDICT (or RAWJSON) RSpeed Text Extraction Flags Defaults The :meth:`TextPage.extractXML` (or *Page.get_text("xml")*) version extracts text (no images) with the detail level of RAWDICT:: The following table shows average relative speeds ("RSpeed", baseline 1.00 is TEXT), taken across ca. 1400 text-heavy and 1300 image-heavy pages. The output may not equal an accustomed "natural" reading order. However, you can request a reordering following the scheme "top-left to bottom-right" by executing `page.get_text("text", sort=True)`. The text extraction methods differ significantly both: in terms of information they supply, and in terms of resource requirements and runtimes. Generally, more information of course means, that more processing is required and a higher data volume is generated. This chapter provides background on the text extraction methods of PyMuPDF. This documentation covers all versions up to |version|. This is a high-speed method, which by default also extracts image meta information: Each image appears as a block with one text line, which contains meta information. The image itself is not shown. This is a high-speed method. As with the previous methods, argument `sort=True` will reorder the words. To address the font issue, you can use a simple utility script to scan through the HTML file and replace font references. Here is a little example that replaces all fonts with one of the :ref:`Base-14-Fonts`: serifed fonts will become "Times", non-serifed "Helvetica" and monospaced will become "Courier". Their respective variations for "bold", "italic", etc. are hopefully done correctly by your browser:: To begin with, all methods are **very fast** in relation to other products out there in the market. In terms of processing speed, we are not aware of a faster (free) tool. Even the most detailed method, RAWDICT, processes all 1'310 pages of the :ref:`AdobeManual` in less than 5 seconds (simple text needs less than 2 seconds here). To show the effect of *TEXT_INHIBIT_SPACES* have a look at this example:: WORDS We have successfully tested `lxml <https://pypi.org/project/lxml/>`_ to interpret this output. Where the first 4 items are the float coordinates of the block's bbox. The lines within each block are concatenated by a new-line character. Where the first 4 items are the float coordinates of the words's bbox. The last three integers provide some more information on the word's whereabouts. While HTML output has improved a lot in MuPDF v1.12.0, it is not yet bug-free: we have found problems in the areas **font support** and **image positioning**. clip to mediabox dehyphenate image bboxes (only), **block** level text with bboxes, line breaks inhibit spaces no images no images, **char** level text, layout and font details no images, **plain** text, line breaks no images, **word** level text with bboxes preserve images preserve ligatures preserve whitespace set **dehyphenation off** in text searches: what do they imply (processing time / data sizes)? what do they provide? Project-Id-Version: PyMuPDF 1.23.0rc1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2024-03-05 14:46+0000
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Suzan Sanver <suzan.sanver@dijipiji.com>
Language: ja
Language-Team: ja <suzan.sanver@dijipiji.com>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.10.3
 **ãjsonã** ã¯ **ãdictã** ã¨ã¾ã£ããåæ§ã«å¦çããããããçç¥ããã¦ãã¾ãã **ãrawjsonã** ã¯ **ãrawdictã** ã¨ã¾ã£ããåæ§ã«å¦çããããããçç¥ããã¦ãã¾ãã **base64ç»å** ã **ã¹ãã³** ã¬ãã«ã®ãã­ã¹ããã¬ã¤ã¢ã¦ãã¨ãã©ã³ãã®è©³ç´° **base64** ç»åã **ã¹ãã³** ã¬ãã«ã®ãã­ã¹ããã¬ã¤ã¢ã¦ãæå ±ãªã **ãã¤ããª** ç»åã**æå­** ã¬ãã«ã®ãã­ã¹ããã¬ã¤ã¢ã¦ãã¨ãã©ã³ãã®è©³ç´° **ãã¤ããª** ç»åã **ã¹ãã³** ã¬ãã«ã®ãã­ã¹ããã¬ã¤ã¢ã¦ãã¨ãã©ã³ãã®è©³ç´° ãdictãåºåããç»åã **é¤å¤ãã** å ´åï¼ ãblocksãåºåã«ç»åã **å«ãã** å ´åï¼ **æ¤ç´¢** ã¯ãã­ã¹ãæ¤ç´¢æ©è½ãæãã¾ãã :meth:`TextPage.extractDICT` ï¼ã¾ãã¯ *Page.get_text("dict", sort=False)* ï¼ã®åºåã¯ã *TextPage* ã®æ§é ãå®å¨ã«åæ ããåãã­ãã¯ãè¡ãã¹ãã³ã®ããã«ç»åã®åå®¹ã¨ä½ç½®ã®è©³ç´°ï¼ *bbox*  â ãã¯ã»ã«åä½ã®å¢çããã¯ã¹ï¼ãæä¾ãã¾ããç»åã¯DICTåºåã§ã¯ *ãã¤ã* ã¨ãã¦æ ¼ç´ãããJSONåºåã§ã¯base64ã¨ã³ã³ã¼ããããæå­åã¨ãã¦æ ¼ç´ããã¾ãã :meth:`TextPage.extractHTML` ï¼ã¾ãã¯ *Page.get_text("html"ï¼* ã®åºåã¯ããã¼ã¸ã® `TextPage` ã®æ§é ãå®å¨ã«åæ ãã¾ããããã¯ãä»¥ä¸ã®DICT / JSONã®ãããªãã®ã§ããããã«ã¯ç»åããã©ã³ãæå ±ããã­ã¹ãä½ç½®ãå«ã¾ãã¾ããHTMLãããã¼ã¨ãã¬ã¤ã©ã¼ã³ã¼ãã§å²ãã¨ãã¤ã³ã¿ã¼ããããã©ã¦ã¶ã§ç°¡åã«è¡¨ç¤ºã§ãã¾ããä¸è¨ã®ä¾ï¼ :meth:`TextPage.extractRAWDICT` ï¼ã¾ãã¯ *Page.get_text("rawdict", sort=False)*  ï¼ã¯ã**DICTã®æå ±ã®ã¹ã¼ãã¼ã»ãã** ã§ãããè©³ç´°ã¬ãã«ãä¸æ®µéæ·±ããã¾ããããã¯ä¸è¨ã®ããã«è¦ãã¾ãããã¹ãã³åã® *ãtextã* ã¢ã¤ãã ï¼æå­åï¼ã¯ *ãcharsã* ã¨ãããªã¹ãã«ç½®ãæãããã¾ããå *ãcharsã* ã¨ã³ããªã¯æå­ã® *dict* ã§ããä¾ãã°ã *ãText in black color.ã* ã®ä»£ããã«ä»¥ä¸ã®ãããªé ç®ãè¡¨ç¤ºããã¾ãï¼ :meth:`TextPage.extractXHTML` ï¼ã¾ãã¯ *Page.get_text("xhtml"ï¼* ã¯ããã­ã¹ãã¨ç»åãå«ãHTMLå½¢å¼ã®TEXTã®ããªã¨ã¼ã·ã§ã³ã§ãï¼ãã»ãã³ãã£ãã¯ãåºåï¼ï¼ :ref:`TextPage` ã¯ï¼Py-ï¼MuPDFã®ã¯ã©ã¹ã®ä¸ã¤ã§ããéå¸¸ã:ref:`Page` ã®ãã­ã¹ãæ½åºã¡ã½ãããä½¿ç¨ãããã¨ãã«ã«ã¼ãã³ã®å¾ãã§ä½æããï¼ããã³ç ´æ£ããï¼ã¾ãããç´æ¥å©ç¨ãããã¨ãã§ããæ°¸ç¶ãªãã¸ã§ã¯ãã¨ãã¦ä½¿ç¨ãããã¨ãã§ãã¾ãããã®ååãç¤ºããããããã­ã¹ããã¼ã¸ã«ã¯ãªãã·ã§ã³ã§ç»åãå«ã¾ããå ´åãããã¾ãï¼ **ãã­ãã¯** ã¯ãè¡ã¨ãã®æå­ãã¾ãã¯ç»åã®ããããããæãç«ã£ã¦ãã¾ãã **è¡** ã¯ãã¹ãã³ããæãç«ã£ã¦ãã¾ãã **ã¹ãã³** ã¯ãåä¸ã®ãã©ã³ããã­ããã£ï¼ååããµã¤ãºããã©ã°ãè²ï¼ãæã¤é£æ¥ããæå­ããæãç«ã£ã¦ãã¾ãã **ãã­ã¹ããã¼ã¸** ã¯ããã­ãã¯ï¼ããããæ®µè½ï¼ã§æ§æããã¦ãã¾ãã ãn/aãã®æå®ã¯å¤ã0ã§ããããã®ããããè¨­å®ãã¦ãåºåã«å½±é¿ãä¸ãããã¨ã¯ããã¾ããï¼ãã ãããã©ã¼ãã³ã¹ã«æªå½±é¿ãåã¼ãå¯è½æ§ãããã¾ãï¼ã ä¾ã®åºåï¼ ä»é²1: ãã­ã¹ãæ½åºã®è©³ç´° åè¿°ã®ããã«ãç»åã®æ½åºãé¤å¤ããå ´åï¼æå¾ã®åï¼ãç¸å¯¾éåº¦ã¯å¤§ããå¤ããã¾ããRAWDICTã¨XMLãé¤ãã¦ãä»ã®ã¡ã½ããã¯ã»ã¼åãéãã§ãããRAWDICTã¯ **ä»ã§ã¯éãXML** ããã40ï¼å°ãªãå®è¡æéãå¿è¦ã¨ãã¾ãã åè¿°ã®åç´ãªãã­ã¹ãåºåã¨åæ§ã«ã`sort` å¼æ°ãä½¿ç¨ãã¦èª­ã¿é ãåå¾ãããã¨ãã§ãã¾ãã ãã­ãã¯ ã³ã¡ã³ã HTMLåºåã®åè³ªã®å¶å¾¡ DICTï¼ã¾ãã¯JSONï¼ ç¹ã«ç»åã¯ **éå¸¸ã«å¤§ããª** å½±é¿ãæã¡ã¾ããå¿è¦ã®ãªãå ´åã¯ãå¿ãç»åãé¤å¤ããï¼ãã©ã°ãã©ã¡ã¼ã¿ãä½¿ç¨ï¼ããã«ãã¦ãã ãããä»¥ä¸ã§è¨åããã¦ãã2,700ãã¼ã¸ã®ç·ãã¼ã¸æ°ãããã©ã«ãã®ãã©ã°è¨­å®ã§å¦çããã«ã¯ãå¨ã¦ã®æ½åºã¡ã½ããã§160ç§ãå¿è¦ã§ãããç»åããã¹ã¦é¤å¤ããå ´åããã®æéã®50%æªæºï¼77ç§ï¼ãå¿è¦ã§ããã ä¾ã®åºåï¼ è¤éãªæ§é ãæã¤PDFã®å ´åãç»åã®ä½ç½®ããµã¤ãºãæ­£ããéç½®ãããªããã¨ãããã¾ããããã¯åè»¢ãããã¼ã¸ãããã¾ãã¾ãªãã¼ã¸bboxã®ããªã¢ã³ããä¸è´ããªãå ´åã«èµ·ããå¯è½æ§ãããã¾ãï¼ãã¨ãã°ã*MediaBox != CropBox* ï¼ãããã«å¯¾å¦ããæ¹æ³ã¯ã¾ã ããã£ã¦ãã¾ããããMuPDFã®ãµã¤ãã«ãã°ãå ±åãã¾ããã è¾æ¸ã®æ§é ã®å¯è¦åã«ã¤ãã¦ã¯ãè¾æ¸åºåã®æ§é ããè¦§ãã ããã é¢æ°  :meth:`TextPage.extractBLOCKS` ï¼ã¾ãã¯ `Page.get_text("blocks")` ï¼ã¯ããã¼ã¸ã®ãã­ã¹ããã­ãã¯ãä»¥ä¸ã®ãããªé ç®ã®ãªã¹ãã¨ãã¦æ½åºãã¾ãï¼ é¢æ°  :meth:`TextPage.extractText` ï¼ã¾ãã¯ *Page.get_text("text")* ï¼ã¯ããã­ã¥ã¡ã³ãã®ä½æèã«ãã£ã¦æå®ãããåã®é åºã§ããã¼ã¸ã®ãã¬ã¼ã³ãã­ã¹ããæ½åºãã¾ãã é¢æ° :meth:`TextPage.extractWORDS` ï¼ã¾ãã¯ *Page.get_text("words")* ï¼ã¯ããã¼ã¸ã®ãã­ã¹ãåèªãä»¥ä¸ã®ãããªé ç®ã®ãªã¹ãã¨ãã¦æ½åºãã¾ãï¼ TextPageã®ä¸è¬çãªæ§é  HTMLãã­ã¹ãã«ã¯åã®ãã­ã¥ã¡ã³ãã§ä½¿ç¨ããããã©ã³ãã¸ã®åç§ãå«ã¾ãã¦ãã¾ãããããã©ã¦ã¶ãããããèªè­ã§ããªãå ´åï¼å°ãªãç¢ºçã§ããï¼ãä»ã®ãã©ã³ãã§ç½®ãæããããçµæãå¥å¦ã«è¦ããããããã¾ããããã®åé¡ã¯ãã©ã¦ã¶ã«ãã£ã¦å¤§ããç°ãªãã¾ããWindowsãã·ã³ã§ã¯ãMS Edgeã¯ãã¾ãåä½ããããããã¾ããããFirefoxã¯ã²ã©ãè¦ããããããã¾ããã ä»¥ä¸ããã®æ§å­ã§ãï¼ ç»åãå«ãåºåããªã¢ã³ããä½¿ç¨ããéã«ç»åã«èå³ããªãå ´åãå¿ãè©²å½ãããããããªãã«è¨­å®ãã¦ãã ãããããã«ãããããã©ã¼ãã³ã¹ãåä¸ããã¹ãã¼ã¹è¦ä»¶ãå¤§å¹ã«åæ¸ããã¾ãã ææ¨ èå³ã®ããæå ±ã¯ä»¥ä¸ã§ã ãã£ã¨ããã©ã¼ãã³ã¹æå ±ã«ã¤ãã¦ã¯ã **ä»é²1ç« ** ããè¦§ãã ããã ã¡ã½ãã ãã¼ã¸ã§ã³1.19.6ã§æ°ããè¿½å ãããå¤æ´ï¼æ¬¡ã®è¡¨ã®ããã©ã«ãã®çµã¿åããã¯ãPythonã®å®æ°ã¨ãã¦å©ç¨å¯è½ã§ãï¼ :data:`TEXTFLAGS_TEXT` ã :data:`TEXTFLAGS_WORDS` ã :data:`TEXTFLAGS_BLOCKS` ã :data:`TEXTFLAGS_DICT` ã :data:`TEXTFLAGS_RAWDICT` ã :data:`TEXTFLAGS_HTML` ã :data:`TEXTFLAGS_XHTML` ã :data:`TEXTFLAGS_XML` ã :data:`TEXTFLAGS_SEARCH` ãããã«ãããããã©ã«ãã®ãã©ã°ãç°¡åã«å¤æ´ã§ãã¾ããä¾ãã°ã ãã¼ã¸ã§ã³1.16.2ã§æ°ããè¿½å ãããã¡ã½ãã :meth:`Page.get_text` ã¯ãæ½åºããããã¼ã¿ã®éã¨åè³ªãå¶å¾¡ããããã®ã­ã¼ã¯ã¼ããã©ã¡ã¼ã¿ `flags` ï¼æ´æ°ï¼ããµãã¼ããã¦ãã¾ããä»¥ä¸ã®è¡¨ã¯ãåæ½åºããªã¨ã¼ã·ã§ã³ã®ããã©ã«ãè¨­å®ï¼ `flags` ãã©ã¡ã¼ã¿ãçç¥ããããNoneã®å ´åï¼ãç¤ºãã¦ãã¾ãã `None` ä»¥å¤ã®å¤ã§flagsãæå®ããå ´åã¯ã**ãã¹ã¦ã®å¿è¦ãªãªãã·ã§ã³** ãè¨­å®ããå¿è¦ããããã¨ã«æ³¨æãã¦ãã ãããåãããè¨­å®ã®èª¬æã¯ããã­ã¹ãæ½åºãã©ã°ãã§ç¢ºèªã§ãã¾ãã PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript ããã©ã¼ãã³ã¹ ãã¬ã¼ã³ãã­ã¹ã PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã RAWDICTï¼ã¾ãã¯RAWJSONï¼ å¹³åç¸å¯¾ ãã­ã¹ãæ½åºãã©ã°ã®ããã©ã«ãå¤ :meth:`TextPage.extractXML` ï¼ã¾ãã¯ *Page.get_text("xml"ï¼* ãã¼ã¸ã§ã³ã¯ãRAWDICTã®è©³ç´°ã¬ãã«ã§ãã­ã¹ãï¼ç»åãªãï¼ãæ½åºãã¾ãï¼ ä»¥ä¸ã®è¡¨ã¯ãç´1400ãã¼ã¸ã®ãã­ã¹ããå¤ããç´1300ãã¼ã¸ãç»åãå¤ããã¼ã¸ã§ã®å¹³åç¸å¯¾éåº¦ï¼ãã¼ã¹ã©ã¤ã³1.00ã¯TEXTï¼ãç¤ºãã¦ãã¾ãã åºåã¯éå¸¸ã®ãèªç¶ãªãèª­ã¿é ã¨ä¸è´ããªãå ´åãããã¾ãããã ãã`page.get_text("text", sort=True)` ãå®è¡ãããã¨ã§ããå·¦ä¸ããå³ä¸ãã®ã¹ã­ã¼ã ã«å¾ã£ãä¸¦ã¹æ¿ããè¦æ±ãããã¨ãã§ãã¾ãã ãã­ã¹ãæ½åºã¡ã½ããã¯ãæå ±ã®æä¾æ¹æ³ã¨ãªã½ã¼ã¹è¦ä»¶ãå®è¡æéã®ä¸¡æ¹ã§å¤§ããç°ãªãã¾ããä¸è¬çã«ãæå ±ãå¤ãã»ã©å¦çãå¿è¦ã§ãããããå¤ãã®ãã¼ã¿ãçæããããã¨ãæå³ãã¾ãã ãã®ç« ã§ã¯ãPyMuPDFã®ãã­ã¹ãæ½åºã¡ã½ããã«é¢ããèæ¯æå ±ãæä¾ãã¾ãã ãã®ãã­ã¥ã¡ã³ãã¯ |version| ã¾ã§ã®ãã¹ã¦ã®ãã¼ã¸ã§ã³ãå¯¾è±¡ã¨ãã¦ãã¾ãã ããã¯é«éãªã¡ã½ããã§ãããããã©ã«ãã§ã¯ç»åã®ã¡ã¿æå ±ãæ½åºããã¾ããåç»åã¯ã¡ã¿æå ±ãå«ã1è¡ã®ãã­ã¹ãè¡ã§è¡¨ããããã­ãã¯ã¨ãã¦è¡¨ç¤ºããã¾ããç»åãã®ãã®ã¯è¡¨ç¤ºããã¾ããã ããã¯é«éãªã¡ã½ããã§ããåã®ã¡ã½ããã¨åæ§ã«ãå¼æ° `sort=True` ãä½¿ç¨ããã¨åèªãåä¸¦ã¹æ¿ãããã¾ãã ãã©ã³ãã®åé¡ã«å¯¾å¦ããããã«ãHTMLãã¡ã¤ã«ãã¹ã­ã£ã³ãããã©ã³ãã®åç§ãç½®æããã·ã³ãã«ãªã¦ã¼ãã£ãªãã£ã¹ã¯ãªãããä½¿ç¨ã§ãã¾ããä»¥ä¸ã¯ããã¹ã¦ã®ãã©ã³ããPDFã®ãã¼ã¹14ãã©ã³ãã®ä¸ã¤ã«ç½®ãæããä¾ã§ãï¼ã»ãªããã©ã³ãã¯ãTimesãã«ãªããã»ãªãã®ãªããã©ã³ãã¯ãHelveticaãã«ãªããç­å¹ãã©ã³ãã¯ãCourierãã«ãªãã¾ããå¤ªå­ãæä½ãªã©ã®åããªã¨ã¼ã·ã§ã³ã¯ããããããã©ã¦ã¶ã«ãã£ã¦æ­£ããå¦çãããã§ãããã ã¾ãå§ãã«ããã¹ã¦ã®ã¡ã½ããã¯å¸å ´ã«ããä»ã®è£½åã¨æ¯ã¹ã¦ **éå¸¸ã«é«é** ã§ããå¦çéåº¦ã®è¦³ç¹ãããããéãï¼ç¡æã®ï¼ãã¼ã«ã¯ç§ãã¡ã®ç¥ãéãå­å¨ãã¾ãããæãè©³ç´°ãªã¡ã½ããã§ããRAWDICTã§ãã :ref:`AdobeManual` ãªãã¡ã¬ã³ã¹ã®1,310ãã¼ã¸ã5ç§æªæºã§å¦çã§ãã¾ãï¼ããã§ã¯ç°¡åãªãã­ã¹ãã¯2ç§æªæºã§å¦çããã¾ãï¼ã `TEXT_INHIBIT_SPACES`  ã®å¹æãç¤ºãããã«ããã®ä¾ããè¦§ãã ããï¼ åèª ãã®åºåãè§£éããããã«lxmlãä½¿ç¨ãã¦æ­£å¸¸ã«ãã¹ããã¾ããã æåã®4ã¤ã®é ç®ã¯ããã­ãã¯ã®ãã¦ã³ãã£ã³ã°ããã¯ã¹ã®æµ®åå°æ°ç¹åº§æ¨ã§ããåãã­ãã¯åã®è¡ã¯æ¹è¡æå­ã§é£çµããã¾ãã æåã®4ã¤ã®é ç®ã¯ãåèªã®ãã¦ã³ãã£ã³ã°ããã¯ã¹ã®æµ®åå°æ°ç¹åº§æ¨ã§ããæå¾ã®3ã¤ã®æ´æ°ã¯ãåèªã®ä½ç½®ã«é¢ããè¿½å æå ±ãæä¾ãã¾ã MuPDF v1.12.0ã§HTMLåºåã¯ããªãæ¹åããã¾ããããã¾ã ãã°ããªãããã§ã¯ããã¾ããã**ãã©ã³ããµãã¼ã** ã**ç»åã®éç½®** ã«é¢ããåé¡ãè¦ã¤ãã£ã¦ãã¾ãã ã¡ãã£ã¢ããã¯ã¹ã«ã¯ãªãã ãã¤ããã¼ã·ã§ã³è§£é¤ ç»åã®ãã¦ã³ãã£ã³ã°ããã¯ã¹ï¼ã®ã¿ï¼ã **ãã­ãã¯** ã¬ãã«ã®ãã­ã¹ãã¨ãã¦ã³ãã£ã³ã°ããã¯ã¹ãæ¹è¡ ã¹ãã¼ã¹ã®æå¶ ç»åãªã ç»åãªãã**æå­** ã¬ãã«ã®ãã­ã¹ããã¬ã¤ã¢ã¦ãã¨ãã©ã³ãã®è©³ç´° ç»åãªãã **ãã¬ã¼ã³** ãã­ã¹ããæ¹è¡ ç»åãªãã **ã¯ã¼ã** ã¬ãã«ã®ãã­ã¹ãã¨ãã¦ã³ãã£ã³ã°ããã¯ã¹ ç»åãä¿æ é£çµãä¿æ ç©ºç½ãä¿æ ãã­ã¹ãæ¤ç´¢ã§ã® **ãã¤ããã¼ã·ã§ã³** ããªãã«è¨­å®ããï¼ ãããã¯ä½ãæå³ããã®ãï¼å¦çæé / ãã¼ã¿ãµã¤ãºï¼ï¼ å½¼ãã¯ä½ãæä¾ããã®ãï¼ 