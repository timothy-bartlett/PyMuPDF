Þ    ^                    ü  C   ý     A     O     _     g     ~          ­  ï   À  Ò   °  n     %   ò    	     
     (
     <
  %   Y
     
  @   
  1  Ú
       $       @     Ú     ê  	     q             ¡     °     ½     Ë     e     å  à   õ  {   Ö     R     b     q               ¥     ¼  u   Ò     H  
   V     a     å  ?   þ  K   >  r        ý     	       L     I   l  ¤   ¶  5   [                ±     Å  n   ×  Ò   F  º       Ô     Ú     è       ½     !   Ð  +   ò          ;     Y     x  ê     ?      À    _   ¯  b!     #     /#  %   C#     i#  +   #     µ#  +   Ò#  !   þ#      $  w   3$  Ä   «$  %   p%  }  %  c   '     x'  
   '  
   '     '  .   ·'     æ'     ÿ'  '  (    C)  g   R*  A   º*  Z  ü*     W,     m,     ,  ?   ¢,  .   â,  l   -  ·  ~-     6/  >   M/  7  /     Ä1  P  Ú1     +3  ¢   23  3   Õ3     	4      4     64  »   L4  í   5     ö5  -  6  ~   37  .   ²7     á7     õ7  -   	8  '   78  (   _8  '   8  v   °8     '9     =9  ¤   M9  -   ò9  x    :  n   :  «   ;  
   ´;  
   ¿;     Ê;     à;  }   r<  ø   ð<  P   é=     :>     O>     i>     >      >  $  6?  á  [@     =D     OD     eD     ~D  È   D     dE  B   {E  -   ¾E  1   ìE  2   F  '   QF  D  yF  ²  ¾G  =  qI  d  ¯K  H  M  *   ]O  -   O  /   ¶O  6   æO  C   P  9   aP  H   P  7   äP     Q     ,Q  =  ÃQ  %   S   *(new in version 1.16.7)* whether to automatically empty the store. **Class API** **Description** **Key** **Method / Attribute** **Support included for ...** *True* or *False* *True* or *False*. A convenience method returning a unique positive integer which will increase by 1 on every invocation. Example usages include creating unique keys in databases - its creation should be faster than using timestamps by an order of magnitude. A dictionary containing the actual values used for configuring PyMuPDF and MuPDF. Also refer to the installation chapter. This is an overview of the keys, each of which describes the status of a support aspect. A dictionary with the following initial content: `{'graphics': 8, 'text': 8, 'graphics_min_line_width': 0.0}`. Base-14 fonts (should always be true) By default PyMuPDF and MuPDF use `malloc()`/`free()` for dynamic memory management. One can instead force them to use the Python allocation functions `PyMem_New()`/`PyMem_Del()`, by modifying *fitz/fitz.i* to do `#define JM_MEMORY 1` and rebuilding PyMuPDF. CBZ documents CJK font extensions CJK font language extensions CJK font subset (China, Japan, Korea) CMYK colorspcae rendering Control suppression of subset fontname tags in text extractions. Current storables cache size in bytes. This value may change (and will usually increase) with every use of a PyMuPDF function. It will (automatically) decrease only when :attr:`Tools.store_maxize` is going to be exceeded: in this case, MuPDF will evict low-usage objects until the value is again in range. EPUB documents Empty MuPDF warnings message buffer. Enable / disable PyMuPDF-specific code, that tries to rebuild valid character quads when encountering nonsense in :meth:`Page.get_text` text extractions. This code depends on certain font properties (ascender and descender), which do not exist in rare situations and cause segmentation faults when trying to access them. This method sets a global parameter in PyMuPDF, which suppresses execution of this code. Example Session Except mentioned above, no other text extraction variants are influenced by this. This is especially true for the options "xml", "xhtml" and "html", which are based on MuPDF code. They extract the font name `"Calibri-Light"`, or even just the **family** name -- `Calibri` in this example. Footnotes For an explanation of the term "TOFU" see `this Wikipedia article <https://en.wikipedia.org/wiki/Noto_fonts>`_.:: Gray colorspace rendering HTML documents ICC profiles IMG documents It is implemented as *int*. This means that the maximum number is *sys.maxsize*. Should this number ever be exceeded, the counter starts over again at 1. It is not part of MuPDF's global context and not threadsafe (not an issue because we do not support threads in PyMuPDF anyway). JPEG2000 images Maximum storables cache size in bytes. PyMuPDF is generated with a value of 268'435'456 (256 MB, the default value), which you should therefore always see here. If this value is zero, then an "unlimited" growth is permitted. MuPDF has dropped support for this in v1.14.0, so we have re-implemented a similar function with the following differences: New in v1.18.10 New in v1.18.5 New in v1.18.6 New in v1.18.9 New in version 1.16.0 New in version 1.16.14 New in version 1.16.8 PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript PDF documents Parameters PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. RGB colorspace rendering Reduce the storables cache by a percentage of its current size. Return all stored MuPDF messages as a string with interspersed line-breaks. Return the current anti-aliasing values. These values control the rendering quality of graphics and text elements. Return type Returns SVG documents Set or inquire reduced bbox heights in text extract and text search methods. Set or inquire the prefix for the id of new annotations, fields or links. Set the new number of bits to use for anti-aliasing. The same value is taken currently for graphics and text rendering. This might change in a future MuPDF release. Show or set whether MuPDF errors should be displayed. TOFU SIL fonts TOFU emoji fonts TOFU historic fonts TOFU symbol fonts Text extraction options "xml", "xhtml" and "html", which directly wrap MuPDF code, are not influenced by this. This class is a collection of utility methods and attributes, mainly around memory management. To simplify and speed up its use, it is automatically instantiated under the name *TOOLS* when PyMuPDF is imported. This memory area is internally used by MuPDF, and it serves as a cache for objects that have already been read and interpreted, thus improving performance. The most bulky object types are images and also fonts. When an application starts up the MuPDF library (in our case this happens as part of *import fitz*), it must specify a maximum size for this area. PyMuPDF's uses the default value (256 MB) to limit memory consumption. Use the methods here to control or investigate store usage. For example: even after a document has been closed and all related objects have been deleted, the store usage may still not drop down to zero. So you might want to enforce that before opening another document. Tools XPS documents a unique positive integer. all TOFU fonts an integer ranging between 0 and 8. Value outside this range will be silently changed to valid values. The value will remain in effect throughout the current session or until changed again. configuration settings of PyMuPDF control suppression of subset fontname tags current storables cache size disable PyMuPDF-specific code empty MuPDF messages on STDOUT generate a unique identifier if not a bool, the current setting is returned. If true, MuPDF errors will be shown on *sys.stderr*, otherwise suppressed. In any case, messages continue to be stored in the warnings store. Upon import of PyMuPDF this value is *True*. if omitted / `None`, the current setting is returned. Arguments evaluating to `True` or `False` set a global variable. If `True`, options "dict", "json", "rawdict" and "rawjson" will return e.g. `"NOHSJV+Calibri-Light"`, otherwise only `"Calibri-Light"` (the default). The setting remains in effect until changed again. if omitted or `None`, the current setting is returned. For other values the *bool()* function is applied to set a global variable. If `True`, :meth:`Page.search_for` and :meth:`Page.get_text` methods return character, span, line or block bboxes that have a height of *font size*. If `False` (standard setting when PyMuPDF is imported), bbox height will be based on font properties and normally equal *line height*. if omitted or `None`, the current setting is returned. For other values the *bool()* function is applied to set a global variable. If `True`, PyMuPDF will not try to access the resp. font properties and use values `ascender=0.8` and `descender=-0.2` instead. if omitted, the current value is returned, default is "fitz". Annotations, fields / widgets and links technically are subtypes of the same type of object (`/Annot`) in PDF documents. An `/Annot` object may be given a unique identifier within a page. For each of the applicable subtypes, PyMuPDF generates identifiers "stem-Annn", "stem-Wnnn" or "stem-Lnnn" respectively. The number "nnn" is used to enforce the required uniqueness. maximum storables cache size overprint rendering return the accumulated MuPDF warnings return the anti-aliasing values search and extract using small bbox heights set the anti-aliasing values set the prefix of new annotation / link ids shrink the storables cache [#f1]_ the current value. the new current store size. Depending on the situation, the size reduction may be larger than the requested percentage. the percentage of current size to free. If 100+ the store will be emptied, if zero, nothing will happen. MuPDF's caching strategy is "least recently used", so low-usage elements get deleted first. using Python memory management [#f2]_ Project-Id-Version: PyMuPDF 1.23.0rc1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-10-12 13:37+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.10.3
 *ï¼ãã¼ã¸ã§ã³1.16.7ã§æ°ãã«è¿½å ï¼* ã¹ãã¢ãèªåçã«ç©ºã«ãããã©ããã **ã¯ã©ã¹API** **èª¬æ** **ã­ã¼** **ã¡ã½ãã/å±æ§** **ãµãã¼ããå«ã¾ãã¦ããã®ã¯...** *True* ã¾ãã¯ *False* *True* ã¾ãã¯ *False*ã 1åã®å¼ã³åºããã¨ã«1ãã¤å¢å ããä¸æã®æ­£ã®æ´æ°ãè¿ãä¾¿å©ãªã¡ã½ããã§ããä½¿ç¨ä¾ã«ã¯ããã¼ã¿ãã¼ã¹åã§ä¸æã®ã­ã¼ãä½æãããã¨ãå«ã¾ãã¾ããã¿ã¤ã ã¹ã¿ã³ããä½¿ç¨ãããããä½æã10åé«éã§ããã¹ãã§ãã PyMuPDFã¨MuPDFãè¨­å®ããããã«ä½¿ç¨ãããå®éã®å¤ãå«ãè¾æ¸ã§ããã¤ã³ã¹ãã¼ã«ã®ç« ãåç§ãã¦ãã ãããããã¯åã­ã¼ãæ¦èª¬ãããã®ã§ãããããããµãã¼ãã®å´é¢ã®ã¹ãã¼ã¿ã¹ãè¨è¿°ãã¦ãã¾ãã ä»¥ä¸ã®åæåå®¹ãæã¤è¾æ¸ï¼ `{'graphics': 8, 'text': 8, 'graphics_min_line_width': 0.0}`ã Base-14ãã©ã³ãï¼å¸¸ã«trueã§ããå¿è¦ãããã¾ãï¼ ããã©ã«ãã§ã¯ãPyMuPDFããã³MuPDFã¯åçã¡ã¢ãªç®¡çã« `malloc()`/`free()` ãä½¿ç¨ãã¾ããä»£ããã«ã*fitz/fitz.i* ãå¤æ´ãã¦ `#define JM_MEMORY 1` ãè¡ããPyMuPDFãåæ§ç¯ãããã¨ã§ãPythonã®å²ãå½ã¦é¢æ° `PyMem_New()`/`PyMem_Del()` ãä½¿ç¨ããããã«å¼·å¶ãããã¨ãã§ãã¾ãã CBZãã­ã¥ã¡ã³ã CJKãã©ã³ãæ¡å¼µ CJKãã©ã³ãã®è¨èªæ¡å¼µ CJKãã©ã³ãã®ãµãã»ããï¼ä¸­å½ãæ¥æ¬ãéå½ï¼ CMYKã«ã©ã¼ã¹ãã¼ã¹ã®ã¬ã³ããªã³ã° ãã­ã¹ãæ½åºã«ããããµãã»ãããã©ã³ãåã®ã¿ã°ãæå¶ããå¶å¾¡ãè¡ãã¾ãã ç¾å¨ã®ã¹ãã¢ãã«ã­ã£ãã·ã¥ã®ãµã¤ãºï¼ãã¤ãåä½ï¼ããã®å¤ã¯ãPyMuPDFã®é¢æ°ãä½¿ç¨ãããã³ã«å¤æ´ãããå¯è½æ§ãããã¾ãï¼éå¸¸ã¯å¢å ãã¾ãï¼ããã®å¤ã¯ã:attr:`Tools.store_maxsize` ãè¶éãããå ´åã«ã®ã¿ï¼èªåçã«ï¼æ¸å°ãããã®å ´åãMuPDFã¯ä½¿ç¨çã®ä½ããªãã¸ã§ã¯ããåé¤ãã¦ãå¤ãåã³ç¯å²åã«åã¾ãããã«ãã¾ãã EPUBãã­ã¥ã¡ã³ã MuPDFã®è­¦åã¡ãã»ã¼ã¸ãããã¡ãç©ºã«ãã¾ãã :meth:`Page.get_text` ãã­ã¹ãæ½åºã§ç¡æå³ãªãã®ãæ¤åºããéã«ãæå¹ãªæå­ã®åè§å½¢ãåæ§ç¯ãããã¨ããPyMuPDFåºæã®ã³ã¼ãã®æå¹å/ç¡å¹åãè¡ãã¾ãããã®ã³ã¼ãã¯ãå­å¨ããªãå ´åããããã©ã³ãã®ç¹æ§ï¼ascenderããã³descenderï¼ã«ä¾å­ãã¦ããããããã®ç¹æ§ã«ã¢ã¯ã»ã¹ãããã¨ããã¨ã»ã°ã¡ã³ãã¼ã·ã§ã³éåãçºçãã¾ãããã®ã¡ã½ããã¯PyMuPDFåã®ã°ã­ã¼ãã«ãã©ã¡ã¼ã¿ãè¨­å®ãããã®ã³ã¼ãã®å®è¡ãæå¶ãã¾ãã ã»ãã·ã§ã³ã®ä¾ ä¸è¨ã«è¨è¼ããã¦ããä»¥å¤ã®ãã­ã¹ãæ½åºããªã¢ã³ãã«ã¯å½±é¿ãã¾ãããç¹ã«ãMuPDFã³ã¼ãã«åºã¥ããªãã·ã§ã³ "xml"ã"xhtml"ã"html" ã«ã¯å½±é¿ãã¾ããããããã¯ãã©ã³ãå `"Calibri-Light"`ãã¾ãã¯ãã®ä¾ã®å ´åã¯ãã¡ããªã¼å `Calibri` ã®ã¿ãæ½åºãã¾ãã èæ³¨ ãTOFUãã®ç¨èªã®èª¬æã«ã¤ãã¦ã¯ã `ãã®ã¦ã£ã­ããã£ã¢ã®è¨äº <https://en.wikipedia.org/wiki/Noto_fonts>`_ ãåç§ãã¦ãã ããã:: ã°ã¬ã¼ã«ã©ã¼ã¹ãã¼ã¹ã®ã¬ã³ããªã³ã° HTMLãã­ã¥ã¡ã³ã ICCãã­ãã¡ã¤ã« IMGãã­ã¥ã¡ã³ã ããã¯intã¨ãã¦å®è£ããã¦ãã¾ããã¤ã¾ããæå¤§å¤ã¯ *sys.maxsize* ã§ãããã®æ°å¤ããã¤ãè¶éãããå ´åãã«ã¦ã³ã¿ã¼ã¯1ããåéãã¾ãã ããã¯MuPDFã®ã°ã­ã¼ãã«ã³ã³ãã­ã¹ãã®ä¸é¨ã§ã¯ãªããã¹ã¬ããã»ã¼ãã§ã¯ããã¾ããï¼ã¨ã«ããPyMuPDFã§ã¯ã¹ã¬ããããµãã¼ããã¦ããªããããããã¯åé¡ã§ã¯ããã¾ããï¼ã JPEG2000ç»å ã¹ãã¢ãã«ã­ã£ãã·ã¥ã®æå¤§ãµã¤ãºï¼ãã¤ãåä½ï¼ã PyMuPDFã¯ãããã©ã«ãå¤ã§ãã268'435'456ï¼256 MBï¼ã§çæããã¦ããããããã£ã¦å¸¸ã«ããã§è¦ãã¯ãã§ãããã®å¤ãã¼ã­ã®å ´åãå¢å ã®ãå¶éãªãããè¨±å¯ããã¦ãã¾ãã MuPDFã¯v1.14.0ã§ããããµãã¼ããä¸­æ­¢ãããããæ¬¡ã®éããæã¤é¡ä¼¼ã®é¢æ°ãåå®è£ãã¾ããã ãã¼ã¸ã§ã³1.18.10ã§è¿½å ããã¾ãã v1.18.5ã§æ°ç»å ´ v1.18.6ã§æ°ç»å ´ ãã¼ã¸ã§ã³1.18.9ã§è¿½å ããã¾ãã ãã¼ã¸ã§ã³1.16.0ã§æ°ãã«è¿½å  ãã¼ã¸ã§ã³1.16.14ã§æ°ãã«è¿½å  ãã¼ã¸ã§ã³1.16.8ã§æ°ãã«è¿½å  PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript PDFãã­ã¥ã¡ã³ã ãã©ã¡ã¼ã¿ PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã RGBã«ã©ã¼ã¹ãã¼ã¹ã®ã¬ã³ããªã³ã° ç¾å¨ã®ãµã¤ãºãåºæºã«ãã¹ãã¬ã¼ã¸ã­ã£ãã·ã¥ã®ãµã¤ãºãæå®ããå²åã§æ¸å°ããã¾ãã ãã¹ã¦ã®ä¿å­ãããMuPDFã¡ãã»ã¼ã¸ããæ¹è¡ãæ¿å¥ãããæå­åã¨ãã¦è¿ãã¾ãã ç¾å¨ã®ã¢ã³ãã¨ã¤ãªã¢ã·ã³ã°å¤ãè¿ãã¾ãããããã®å¤ã¯ãã°ã©ãã£ãã¯ã¹ã¨ãã­ã¹ãè¦ç´ ã®ã¬ã³ããªã³ã°åè³ªãå¶å¾¡ãã¾ãã æ»ãå¤: è¿ãå¤: SVGãã­ã¥ã¡ã³ã ãã­ã¹ãæ½åºããã³ãã­ã¹ãæ¤ç´¢ã¡ã½ããã§ã®bboxã®é«ããç¸®å°ãããã©ãããè¨­å®ã¾ãã¯åãåããã¾ãã æ°ããæ³¨éããã£ã¼ã«ããã¾ãã¯ãªã³ã¯ã®IDã®ãã¬ãã£ãã¯ã¹ãè¨­å®ã¾ãã¯åãåããã¾ãã ã¢ã³ãã¨ã¤ãªã¢ã·ã³ã°ã«ä½¿ç¨ãããããæ°ãè¨­å®ãã¾ããç¾å¨ã¯ã°ã©ãã£ãã¯ã¹ã¨ãã­ã¹ãã®ã¬ã³ããªã³ã°ã«åãå¤ãä½¿ç¨ããã¾ããå°æ¥ã®MuPDFãªãªã¼ã¹ã§å¤æ´ãããããããã¾ããã MuPDFã®ã¨ã©ã¼ãè¡¨ç¤ºãããã©ãããè¡¨ç¤ºã¾ãã¯è¨­å®ãã¾ãã TOFU SILãã©ã³ã TOFUçµµæå­ãã©ã³ã TOFUæ­´å²çãã©ã³ã TOFUã·ã³ãã«ãã©ã³ã ç´æ¥MuPDFã³ã¼ããã©ãããããã­ã¹ãæ½åºãªãã·ã§ã³ãxmlãããxhtmlãããhtmlãã¯ãããã«å½±é¿ãåãã¾ããã ãã®ã¯ã©ã¹ã¯ãã¡ã¢ãªç®¡çãä¸­å¿ã¨ããã¦ã¼ãã£ãªãã£ã¡ã½ããã¨å±æ§ã®ã³ã¬ã¯ã·ã§ã³ã§ããä½¿ç¨ãç°¡ç´ åããé«éåããããã«ãPyMuPDFãã¤ã³ãã¼ããããã¨ãèªåçã« *TOOLS* ã¨ããååã§ã¤ã³ã¹ã¿ã³ã¹åããã¾ãã ãã®ã¡ã¢ãªé åã¯MuPDFåé¨ã§ä½¿ç¨ãããæ¢ã«èª­ã¿åããè§£éããããªãã¸ã§ã¯ãã®ã­ã£ãã·ã¥ã¨ãã¦æ©è½ããããã©ã¼ãã³ã¹ãåä¸ããã¾ããæãéããªãã¸ã§ã¯ãã®ã¿ã¤ãã¯ç»åããã³ãã©ã³ãã§ããã¢ããªã±ã¼ã·ã§ã³ãMuPDFã©ã¤ãã©ãªãèµ·åããã¨ãï¼ç§ãã¡ã®å ´åãããã¯ *import fitz* ã®ä¸é¨ã¨ãã¦çºçãã¾ãï¼ããã®é åã®æå¤§ãµã¤ãºãæå®ããå¿è¦ãããã¾ãã PyMuPDFã¯ã¡ã¢ãªæ¶è²»ãå¶éããããã«ããã©ã«ãå¤ï¼256 MBï¼ãä½¿ç¨ãã¾ããããã§æä¾ããã¦ããã¡ã½ãããä½¿ç¨ãã¦ã¹ãã¢ã®ä½¿ç¨ç¶æ³ãå¶å¾¡ã¾ãã¯èª¿æ»ã§ãã¾ãããã¨ãã°ãææ¸ãéããããé¢é£ãããã¹ã¦ã®ãªãã¸ã§ã¯ããåé¤ãããå¾ã§ããã¹ãã¢ã®ä½¿ç¨ç¶æ³ãã¼ã­ã«ãªããªããã¨ãããã¾ãããããã£ã¦ãå¥ã®ææ¸ãéãåã«ãããå¼·å¶ãããããããã¾ããã Tools (ãã¼ã«) XPSãã­ã¥ã¡ã³ã ä¸æã®æ­£ã®æ´æ°ã ãã¹ã¦ã®TOFUãã©ã³ã 0ãã8ã¾ã§ã®ç¯å²ã®æ´æ°ããã®ç¯å²å¤ã®å¤ã¯éãã«æå¹ãªå¤ã«å¤æ´ããã¾ãããã®å¤ã¯ãç¾å¨ã®ã»ãã·ã§ã³å¨ä½ã¾ãã¯ååº¦å¤æ´ãããã¾ã§æå¹ã§ãã PyMuPDFã®è¨­å®è¨­å® ãµãã»ãããã©ã³ãåã¿ã°ã®æå¶ãå¶å¾¡ãã¾ãã ç¾å¨ã®æ ¼ç´å¯è½ã­ã£ãã·ã¥ãµã¤ãº PyMuPDFåºæã®ã³ã¼ããç¡å¹ã«ãã¾ãã STDOUTã®MuPDFã¡ãã»ã¼ã¸ãç©ºã«ãã¾ãã ä¸æã®è­å¥å­ãçæãã¾ãã boolã§ãªãå ´åãç¾å¨ã®è¨­å®ãè¿ããã¾ããTrueã®å ´åãMuPDFã®ã¨ã©ã¼ã¯ *sys.stderr* ã«è¡¨ç¤ºãããããä»¥å¤ã®å ´åã¯æå¶ããã¾ãããããã®å ´åããã¡ãã»ã¼ã¸ã¯è­¦åã¹ãã¢ã«å¼ãç¶ãä¿å­ããã¾ããPyMuPDFã®ã¤ã³ãã¼ãæã«ãã®å¤ã¯ *True* ã§ãã çç¥ãããå ´å `None`ãç¾å¨ã®è¨­å®ãè¿ããã¾ãã`True` ã¾ãã¯ `False` ã®å¤ãè©ä¾¡ãã¦ãã°ã­ã¼ãã«å¤æ°ãè¨­å®ãã¾ãã`True` ã®å ´åããªãã·ã§ã³ "dict"ã"json"ã"rawdict"ã"rawjson" ã¯ä¾ãã° `"NOHSJV+Calibri-Light"` ã®ããã«è¿ãããããä»¥å¤ã®å ´åã¯ããã©ã«ãã® `"Calibri-Light"` ã®ã¿ãè¿ããã¾ããè¨­å®ã¯ååº¦å¤æ´ãããã¾ã§æå¹ã§ãã çç¥ãããå ´åã¾ãã¯ `None` ã®å ´åãç¾å¨ã®è¨­å®ãè¿ããã¾ããä»ã®å¤ã®å ´åã*bool()* é¢æ°ãé©ç¨ãããã°ã­ã¼ãã«å¤æ°ãè¨­å®ãã¾ãã`True` ã®å ´åã:meth:`Page.search_for` ããã³ :meth:`Page.get_text` ã¡ã½ããã¯ *ãã©ã³ããµã¤ãº* ã®é«ããæã¤æå­ãã¹ãã³ãè¡ãã¾ãã¯ãã­ãã¯ã®bboxãè¿ãã¾ãã`False` ã®å ´åï¼PyMuPDFãã¤ã³ãã¼ããããã¨ãã®æ¨æºè¨­å®ï¼ãbboxã®é«ãã¯ãã©ã³ãã®ãã­ããã£ã«åºã¥ããéå¸¸ã¯ *è¡ã®é«ã* ã¨åãã§ãã çç¥ãããå ´åãã¾ãã¯ `None` ãç¾å¨ã®è¨­å®ãè¿ããã¾ããä»ã®å¤ã®å ´åã*bool()* é¢æ°ãé©ç¨ãããã°ã­ã¼ãã«å¤æ°ãè¨­å®ãã¾ãã`True` ã®å ´åãPyMuPDFã¯è©²å½ãããã©ã³ãã®ç¹æ§ã«ã¢ã¯ã»ã¹ãããã¨ãããä»£ããã« `ascender=0.8` ããã³ `descender=-0.2` ã®å¤ãä½¿ç¨ãã¾ãã çç¥ãããå ´åãç¾å¨ã®å¤ãè¿ãããããã©ã«ãã¯  "fitz" ã§ããæ³¨éããã£ã¼ã«ã/ã¦ã£ã¸ã§ãããããã³ãªã³ã¯ã¯æè¡çã«ã¯PDFææ¸åã®åãç¨®é¡ã®ãªãã¸ã§ã¯ãï¼`/Annot`ï¼ã®ãµãã¿ã¤ãã§ãã`/Annot` ãªãã¸ã§ã¯ãã¯ããã¼ã¸åã§ä¸æã®è­å¥å­ãæã¤ãã¨ãã§ãã¾ããé©ç¨å¯è½ãªãµãã¿ã¤ããã¨ã«ãPyMuPDFã¯ãããã "stem-Annn"ã"stem-Wnnn"ãã¾ãã¯ "stem-Lnnn" ã®è­å¥å­ãçæãã¾ããçªå· "nnn" ã¯å¿è¦ãªä¸ææ§ãå¼·å¶ããããã«ä½¿ç¨ããã¾ãã æå¤§æ ¼ç´å¯è½ã­ã£ãã·ã¥ãµã¤ãº ãªã¼ãã¼ããªã³ãã®ã¬ã³ããªã³ã° èç©ãããMuPDFã®è­¦åãè¿ãã¾ãã ã¢ã³ãã¨ã¤ãªã¢ã·ã³ã°ã®å¤ãè¿ãã¾ãã å°ããªbboxé«ããä½¿ç¨ãã¦æ¤ç´¢ããã³æ½åºãã¾ãã ã¢ã³ãã¨ã¤ãªã¢ã·ã³ã°ã®å¤ãè¨­å®ãã¾ãã æ°ããæ³¨é/ãªã³ã¯IDã®ãã¬ãã£ãã¯ã¹ãè¨­å®ãã¾ãã æ ¼ç´å¯è½ã­ã£ãã·ã¥ãç¸®å°ãã¾ã [#f1]_ã ç¾å¨ã®å¤ã æ°ããç¾å¨ã®ã¹ãã¢ãµã¤ãºãç¶æ³ã«å¿ãã¦ãè¦æ±ãããå²åããããµã¤ãºãå¤§å¹ã«åæ¸ãããå ´åãããã¾ãã ç¾å¨ã®ãµã¤ãºã®ä½ãã¼ã»ã³ããè§£æ¾ããããæå®ãã¾ãã100ä»¥ä¸ã®å ´åãã¹ãã¢ã¯ç©ºã«ãªãã¾ããããããä½ãå¤æ´ããã¾ãããMuPDFã®ã­ã£ãã·ã³ã°æ¦ç¥ã¯ãæå¾ã«ä½¿ç¨ããããã®ããªã®ã§ãä½¿ç¨é »åº¦ã®ä½ãè¦ç´ ãæåã«åé¤ããã¾ãã Pythonã¡ã¢ãªç®¡çãä½¿ç¨ [#f2]_ 