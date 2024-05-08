Þ    s      ´              L  3   M            ò   ¨  2    æ   Î	     µ
  &   Ë
  v  ò
  '   i  Ñ     "  c      ï     *  û     &  B   Ã  ì        ó          #  "   ;  m   ^  2   Ì  #   ÿ  E   #  8   i     ¢     ¸     Î     ä  ü   ë  u   è     ^     p     ô  D  ù  O   >  \     O   ë     ;  ~   L  ¶   Ë  >     Ä  Á  "     =   ©  ã   ç  /  Ë     û  2        ²!  7   >"     v"  /   û"     +#     ;#  1   M#  N   #  !   Î#  "   ð#  #   $      7$  .   X$     $     ¥$  )   Ã$  ¯   í$  m   %     &  "   &     :&     U&     f&     &      £&     Ä&  0   Ý&  "   '  "   1'     T'  1   f'     '  )   '  -   È'  !   ö'     (     !(     <(     T(     X(     i(  2   y(     ¬(     É(     Ü(  /   í(     )     ))     >)  >   V)  4   )     Ê)     ä)     *  !   *  #   A*     e*     k*     *     ¤*     ¿*     Õ*  .   è*    +  P   ´,     -     -  :  0-    k.  7  þ/     61  1   G1  È  y1  0   B3  Ü   s3  °  P4  Î  6  )  Ð7  ¤  ú8  Ã   :  Q   c;    µ;     Î<     î<     =  1   .=  }   `=  6   Þ=  !   >  y   7>  9   ±>     ë>     
?  $   )?     N?  ^  U?  v   ´@     +A  ¤   DA     éA    ÷A     xC  r   D  p   vD     çD  Ç   úD  Ã   ÂE  F   F  ø  ÍF  %   ÆH  7   ìH  
  $I  8  /J  ¸   hK  y  !L  Í   M  h   iN  Ô   ÒN  ?   §O     çO     þO  3   P  a   KP     ­P     ÃP     ÙP     ïP  ,   Q  7   2Q  +   jQ  1   Q  è   ÈQ     ±R     IS  /   \S     S     ¢S     ¸S      ÉS      êS  '   T  B   3T  *   vT  *   ¡T  	   ÌT  >   ÖT     U  3   U  ?   MU  +   U     ¹U     ÀU     ÑU     ðU     ÷U     
V  5   V     PV     aV     }V  -   V  	   ÁV  '   ËV     óV  <   W  Q   OW     ¡W      ²W      ÓW  '   ôW  9   X     VX     ]X     yX     X     ·X     ÐX  8   êX   **(Changed in v1.19.0)** Hence some classification: **Class API** **Methods / Attributes** **Possible paradox:** The result may be empty, **even if** the rectangle is **not** empty! In such cases, the result obviously does **not** contain the rectangle. This is because MuPDF's algorithm allows for a small tolerance (1e-3). Example: **Rectangles are (semi-) open:** The right and the bottom edges (including the resp. corners) are not considered part of the rectangle. This implies, that only the top-left corner `(x0, y0)` can ever belong to the rectangle - the other three corners never do. An empty rectangle contains no corners at all. **Replace** the rectangle with its valid version. This is done by shuffling the rectangle corners. After completion of this method, the bottom right corner will indeed be south-eastern to the top left one (but may still be empty). **Short Description** **exactly one infinite rect / irect!** *Rect* represents a rectangle defined by four floating point numbers x0, y0, x1, y1. They are treated as being coordinates of two diagonally opposite points. The first two numbers are regarded as the "top left" corner P\ :sub:`(x0,y0)` and P\ :sub:`(x1,y1)` as the "bottom right" one. However, these two properties need not coincide with their intuitive meanings -- read on. :ref:`Quad` made from rectangle corners A rectangle in the sense of (Py-) MuPDF **(and PDF)** always has **borders parallel to the x- resp. y-axis**. A general orthogonal tetragon **is not a rectangle** -- in contrast to the mathematical definition. A rectangle is called **empty** if `x0 >= x1` or `y0 >= y1`. This implies, that **invalid rectangles are also always empty.** And `width` (resp. `height`) is **set to zero** if `x0 > x1` (resp. `y0 > y1`). In previous versions, a rectangle was empty only if one of width or height was zero. A rectangle is called **valid** if `x0 <= x1` and `y0 <= y1` (i.e. the bottom right point is "south-eastern" to the top left one), otherwise **invalid**. Of the four alternatives above, **only the first** is valid. Please take into account, that in MuPDF's coordinate system, the y-axis is oriented from **top to bottom**. Invalid rectangles have been called infinite in earlier versions. Calculate the area of the rectangle and, with no parameter, equals *abs(rect)*. Like an empty rectangle, the area of an infinite rectangle is also zero. So, at least one of *pymupdf.Rect(p1, p2)* and *pymupdf.Rect(p2, p1)* has a zero area. Checks whether *x* is contained in the rectangle. It may be an *IRect*, *Rect*, *Point* or number. If *x* is an empty rectangle, this is always true. If the rectangle is empty this is always *False* for all non-empty rectangles and for all points. `x in rect` and `rect.contains(x)` are equivalent. Checks whether the rectangle and a :data:`rect_like` "r" contain a common non-empty :ref:`Rect`. This will always be *False* if either is infinite or empty. Compute the matrix which transforms this rectangle to a given one. Creates the smallest containing :ref:`IRect`. This is **not** the same as simply rounding the rectangle's edges: The top left corner is rounded upwards and to the left while the bottom right corner is rounded downwards and to the right. Equals *Point(x0, y0)*. Equals `Point(x0, y1)`. Equals `Point(x1, y0)`. Equals result of method *round()*. For any given quadruple of numbers, the geometrically "same" rectangle can be defined in four different ways: Height of the rectangle. Equals `max(y1 - y0, 0)`. Here is an overview of the changes. If "rect" is specified, the constructor creates a **new copy** of it. If the rectangle is **empty**, the result is also empty. New in version 1.16.0 New in version 1.17.0 New in version 1.19.3 Notion Overloaded constructors: *top_left*, *bottom_right* stand for :data:`point_like` objects, "sequence" is a Python sequence type of 4 numbers (see :ref:`SequenceTypes`), "rect" means another :data:`rect_like`, while the other parameters mean coordinates. PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript Point to include. PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. Rect Rectangle coordinates **cannot be outside** the number range from `FZ_MIN_INF_RECT = -2147483648` to `FZ_MAX_INF_RECT = 2147483520`. Both values have been chosen, because they are the smallest / largest 32bit integers that survive C float conversion roundtrips. In previous versions there was no limit for coordinate values. Rectangles can be used with arithmetic operators -- see chapter :ref:`Algebra`. Return a new quad after applying a matrix to the rectangle using the fixed point `fixpoint`. Return the Euclidean norm of the rectangle treated as a vector of four numbers. Second rectangle Specify required unit: respective squares of *px* (pixels, default), *in* (inches), *cm* (centimeters), or *mm* (millimeters). The constructing points can be (almost! -- see below) anywhere in the plane -- they need not even be different, and e.g. "top left" need not be the geometrical "north-western" point. The following remarks are also valid for :ref:`IRect` objects: The intersection (common rectangular area, largest rectangle contained in both) of the current rectangle and *r* is calculated and **replaces the current** rectangle. If either rectangle is empty, the result is also empty. If *r* is infinite, this is a no-operation. If the rectangles are (mathematically) disjoint sets, then the result is invalid. If the result is valid but empty, then the rectangles touch each other in a corner or (part of) a side. The matrix for the transformation. The quadrilateral `Quad(rect.tl, rect.tr, rect.bl, rect.br)`. The smallest rectangle containing the current one and *r* is calculated and **replaces the current** one. If either rectangle is infinite, the result is also infinite. If one is empty, the other one will be taken as the result. The smallest rectangle containing the current one and point *p* is calculated and **replaces the current** one. **The infinite rectangle remains unchanged.** To create a rectangle containing a series of points, start with (the empty) *pymupdf.Rect(p1, p1)* and successively include the remaining points. There are new top level functions defining infinite and standard empty rectangles and quads, see :meth:`INFINITE_RECT` and friends. There is **exactly one "infinite" rectangle**, defined by `x0 = y0 = FZ_MIN_INF_RECT` and `x1 = y1 = FZ_MAX_INF_RECT`. It contains every other rectangle. It is mainly used for technical purposes -- e.g. when a function call should ignore a formally required rectangle argument. This rectangle is not empty. This class adheres to the Python sequence protocol, so components can be accessed via their index, too. Also refer to :ref:`SequenceTypes`. This documentation covers all versions up to |version|. Transforms the rectangle with a matrix and **replaces the original**. If the rectangle is empty or infinite, this is a no-operation. Units are in points, where 72 points is 1 inch. Versions 1.19.* Versions < 1.19.0 Width of the rectangle. Equals `max(x1 - x0, 0)`. Without parameters, the empty rectangle *Rect(0.0, 0.0, 0.0, 0.0)* is created. X-coordinate of the left corners. X-coordinate of the right corners. Y-coordinate of the bottom corners. Y-coordinate of the top corners. `FZ_MIN_INF_RECT <= number <= FZ_MAX_INF_RECT` `True` if rectangle is empty. `True` if rectangle is valid. `True` if this is the infinite rectangle. a matrix `mat` such that `self * mat = rect`. Can for example be used to transform between the page and the pixmap coordinates. See an example use here :ref:`RecipesImages_P`. a new :ref:`Quad`. This a wrapper for the same-named quad method. If infinite, the infinite quad is returned. all numbers all rects where x0 > x1 or y1 > y0 are parts of the rectangle borders, corners bottom corners' y coordinate bottom left point, synonym *bl* bottom right point, synonym *br* calculate rectangle area checks containment of point_likes and rect_likes checks for non-empty intersections common part with another rectangle coordinate values create smallest :ref:`Irect` containing rectangle empty enlarge rectangle to also contain a point enlarge rectangle to also contain another one equals result of method *round()* infinite left corners' x coordinate makes a rectangle valid n/a rectangle height rectangle width right and bottom corners and edges **are outside** right corners' x -coordinate the Euclidean norm the fixed point. the matrix that transforms to another rectangle the matrix. the object to check. the rectangle to check. the smallest rectangle that contains the transformed original. the target rectangle. Must not be empty or infinite. top corners' y coordinate top left point, synonym *tl* top_right point, synonym *tr* transform rectangle with a matrix transform with a point and a matrix valid whether rectangle is empty whether rectangle is infinite whether rectangle is valid x0 <= x1 and y0 <= y1 x0 = x1 or y0 = y1 x0 >= x1 or y0 >= y1 -- includes invalid rects Project-Id-Version: PyMuPDF 1.23.0rc1
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
 **(v1.19.0ã§å¤æ´)** ãããã£ã¦ãããã¤ãã®åé¡ãããã¾ãã **ã¯ã©ã¹API** **ã¡ã½ãã / å±æ§** **å¯è½æ§ã®ããéèª¬:** ç©å½¢ãç©ºã§ **ãªã** å ´å **ã§ã** ãçµæãç©ºã«ãªããã¨ãããã¾ãï¼ãã®ãããªå ´åãçµæã¯æããã«ç©å½¢ã **å«ã¿ã¾ãã**ãããã¯ãMuPDFã®ã¢ã«ã´ãªãºã ãããããªè¨±å®¹å·®ï¼1e-3ï¼ãè¨±å®¹ãã¦ããããã§ããä¾ï¼ **ç©å½¢ã¯ï¼åï¼éãã¦ãã¾ã**ãå³å´ã¨ä¸å´ã®ã¨ãã¸ï¼ããã³ããã«å«ã¾ããã³ã¼ãã¼ï¼ã¯ç©å½¢ã®ä¸é¨ã¨ã¯è¦ãªããã¾ããããããã£ã¦ãç©å½¢ã«å±ãããã¨ãã§ããã®ã¯å·¦ä¸ã®ã³ã¼ãã¼  `(x0, y0)` ã®ã¿ã§ããä»ã®3ã¤ã®ã³ã¼ãã¼ã¯å¸¸ã«å«ã¾ãã¾ãããç©ºã®ç©å½¢ã«ã¯ã¾ã£ããã³ã¼ãã¼ãå«ã¾ãã¦ãã¾ããã é·æ¹å½¢ããã®æå¹ãªãã¼ã¸ã§ã³ã§ **ç½®ãæãã¾ã**ãããã¯é·æ¹å½¢ã®ã³ã¼ãã¼ãã·ã£ããã«ãã¦è¡ãã¾ãããã®ã¡ã½ããã®å®äºå¾ãå³ä¸ã®ã³ã¼ãã¼ã¯ç¢ºãã«å·¦ä¸ã®ã³ã¼ãã¼ã®åæ±ã«ãªãã¾ãï¼ãã ããç©ºã§ããå¯è½æ§ãããã¾ãï¼ã **ç­ãèª¬æ** **ç¡éã®ç©å½¢ / irectã¯1ã¤ã ãã§ãï¼** *Rect* ã¯ã4ã¤ã®æµ®åå°æ°ç¹æ°x0ãy0ãx1ãy1ã«ãã£ã¦å®ç¾©ãããç©å½¢ãè¡¨ãã¾ãããããã¯å¯¾è§ç·ä¸ã®2ã¤ã®ç¹ã®åº§æ¨ã¨è¦ãªããã¾ããæåã®2ã¤ã®æ°ã¯ãå·¦ä¸ãã®ã³ã¼ãã¼ P\ :sub:`(x0,y0)` ã¨ãã P\ :sub:`(x1,y1)` ã¯ãå³ä¸ãã®ã³ã¼ãã¼ã¨ãã¾ãããã ããããã2ã¤ã®ãã­ããã£ã¯ç´æçãªæå³ã¨ä¸è´ããå¿è¦ã¯ããã¾ãããä»¥ä¸ãèª­ãã§ãã ããã åè§å½¢ã®è§ããä½æããã :ref:`Quad` (Py-)MuPDF **ï¼ããã³PDFï¼** ã®æå³ã§ã®ç©å½¢ã¯å¸¸ã« **x-ã¾ãã¯yè»¸ã«å¹³è¡ãªå¢ç** ãæã¡ã¾ããä¸è¬çãªç´äº¤åè§å½¢ã¯ **ç©å½¢ã§ã¯ãªã** ãæ°å­¦çãªå®ç¾©ã¨ã¯å¯¾ç§çã§ãã ç©å½¢ã¯ã `x0 >= x1`  ã¾ãã¯  `y0 >= y1`  ã®å ´åã« **ç©º** ã¨å¼ã°ãã¾ããããã¯ã**ç¡å¹ãªç©å½¢** ãå¸¸ã«ç©ºã§ãããã¨ãæå³ãã¾ããã¾ãã `x0 > x1` ï¼ã¾ãã¯ `y0 > y1` ï¼ã®å ´åãå¹ï¼ã¾ãã¯é«ãï¼ã¯ **ã¼ã­ã«è¨­å®** ããã¾ããä»¥åã®ãã¼ã¸ã§ã³ã§ã¯ãç©å½¢ãç©ºã§ããã®ã¯å¹ã¾ãã¯é«ãã®ãããããã¼ã­ã®å ´åã«éããã¦ãã¾ããã ç©å½¢ã¯ã `x0 <= x1`  ããã³  `y0 <= y1` ï¼ã¤ã¾ããå³ä¸ã®ç¹ãå·¦ä¸ã®ç¹ã®ãåæ±ãã«ããï¼ã®å ´åã«ã®ã¿ **æå¹** ã¨å¼ã°ãã¾ãããããã£ã¦ãä¸è¨ã®4ã¤ã®ä»£æ¿æ¡ã®ãã¡ã**æåã®ãã®ã ã** ãæå¹ã§ããMuPDFã®åº§æ¨ç³»ã§ã¯ãyè»¸ã¯ **ä¸ããä¸** ã«åãã£ã¦ãã¾ãã®ã§ãæ³¨æãã¦ãã ãããç¡å¹ãªç©å½¢ã¯ä»¥åã®ãã¼ã¸ã§ã³ã§ã¯ ç¡éã¨å¼ã°ãã¦ãã¾ããã é·æ¹å½¢ã®é¢ç©ãè¨ç®ãããã©ã¡ã¼ã¿ã¼ãªãã§ *absï¼rectï¼* ã¨åãã§ããç©ºã®é·æ¹å½¢ã®é¢ç©ã¯ã¼ã­ã§ãããããå°ãªãã¨ã *pymupdf.Rectï¼p1ãp2ï¼* ã¨ *pymupdf.Rectï¼p2ãp1ï¼* ã®ãããããã¼ã­ã®é¢ç©ãæã£ã¦ããå¿è¦ãããã¾ãã *x* ãåè§å½¢åã«å«ã¾ãã¦ãããã©ããããã§ãã¯ãã¾ããxã¯ *IRect*ã*Rect*ã*Point*ãã¾ãã¯æ°å¤ã®ããããã§ãããã *x* ãç©ºã®åè§å½¢ã§ããå ´åãããã¯å¸¸ã«trueã§ããåè§å½¢ãç©ºã§ããå ´åãããã¯ãã¹ã¦ã®ç©ºã§ãªãåè§å½¢ã¨ãã¹ã¦ã®ãã¤ã³ãã«å¯¾ãã¦å¸¸ã«falseã§ãã`x in rect` ããã³ `rect.contains(x)` ã¯åç­ã§ãã é·æ¹å½¢ã¨ :data:`rect_like` "r" ãå±éã®éç©ºã®Rectãå«ããã©ããããã§ãã¯ãã¾ããã©ã¡ãããç¡éã¾ãã¯ç©ºã®å ´åãããã¯å¸¸ã« *False* ã«ãªãã¾ãã ãã®é·æ¹å½¢ãæå®ããé·æ¹å½¢ã«å¤æããè¡åãè¨ç®ãã¾ãã æå°ã® :ref:`IRect` ãä½æãã¾ããããã¯åã«é·æ¹å½¢ã®ã¨ãã¸ãåæ¨äºå¥ãããã¨ã¨ã¯ **ç°ãªãã¾ã**ãå·¦ä¸ã®ã³ã¼ãã¼ã¯ä¸æ¹åããã³å·¦æ¹åã«ä¸¸ããããå³ä¸ã®ã³ã¼ãã¼ã¯ä¸æ¹åããã³å³æ¹åã«ä¸¸ãããã¾ãã *Point(x0, y0)* ã¨ç­ããã `Point(x0, y1)` ã¨ç­ããã `Point(x1, y0)` ã¨ç­ããã *round()* ã¡ã½ããã®çµæã¨åãã§ãã ä¸ãããã4ã¤ã®æ°å¤ã«å¯¾ãã¦ãå¹¾ä½å­¦çã«ãåããç©å½¢ã¯4ã¤ã®ç°ãªãæ¹æ³ã§å®ç¾©ã§ãã¾ãã é·æ¹å½¢ã®é«ãã`max(y1 - y0, 0)` ã¨ç­ããã ä»¥ä¸ã¯å¤æ´ã®æ¦è¦ã§ãã "rect" ãæå®ããã¦ããå ´åãã³ã³ã¹ãã©ã¯ã¿ã¼ã¯ããã® **æ°ããã³ãã¼** ãä½æãã¾ãã ããç©å½¢ãç©ºã®å ´åãçµæã **ç©º** ã§ãã æ°æ©è½ãã¼ã¸ã§ã³1.16.0 æ°æ©è½ãã¼ã¸ã§ã³1.17.0 æ°æ©è½ï¼ãã¼ã¸ã§ã³1.19.3ï¼ æ¦è¦ ãªã¼ãã¼ã­ã¼ããããã³ã³ã¹ãã©ã¯ã¿ã¼ï¼*top_left*ã*bottom_right* ã¯ :data:`point_like` ãªãã¸ã§ã¯ããè¡¨ãããsequenceãã¯4ã¤ã®æ°å¤ãããªãPythonã·ã¼ã±ã³ã¹åã§ãï¼:ref:`SequenceTypes` ãåç§ï¼ãrectã¯å¥ã® :data:`rect_like` ãæå³ããä»ã®ãã©ã¡ã¼ã¿ã¼ã¯åº§æ¨ãæå³ãã¾ãã PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript å«ãããã¤ã³ãã PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã Rect (ç©å½¢) ç©å½¢ã®åº§æ¨ã¯ã`FZ_MIN_INF_RECT = -2147483648` ãã `FZ_MAX_INF_RECT = 2147483520`  ã¾ã§ã®æ°å¤ç¯å²åã«ããå¿è¦ãããã¾ãããããã®å¤ã¯ãCæµ®åå°æ°ç¹å¤æã®ã©ã¦ã³ãããªãããçãæ®ãæå°/æå¤§ã®32ãããæ´æ°ã§ããããé¸ã°ãã¾ãããä»¥åã®ãã¼ã¸ã§ã³ã§ã¯ãåº§æ¨å¤ã®å¶éã¯ããã¾ããã§ããã åè§å½¢ã¯ç®è¡æ¼ç®å­ã¨çµã¿åããã¦ä½¿ç¨ã§ãã¾ã - :ref:`Algebra` ã®æ¼ç®å­ä»£æ°ã®ç« ãåç§ãã¦ãã ããã åºå®ç¹ `fixpoint` ãä½¿ç¨ãã¦ãè¡åãé·æ¹å½¢ã«é©ç¨ããå¾ã®æ°ããåè§å½¢ãè¿ãã¾ãã åè§å½¢ã4ã¤ã®æ°å¤ã®ãã¯ãã«ã¨ãã¦æ±ã£ãå ´åã®ã¦ã¼ã¯ãªãããã«ã ãè¿ãã¾ãã ç¬¬äºã®é·æ¹å½¢ å¿è¦ãªåä½ãæå®ãã¾ãï¼ *px* ï¼ãã¯ã»ã«ãããã©ã«ãï¼ã®å¹³æ¹ã*in* ï¼ã¤ã³ãï¼ã*cm* ï¼ã»ã³ãã¡ã¼ãã«ï¼ãã¾ãã¯ *mm* ï¼ããªã¡ã¼ãã«ï¼ã®å¹³æ¹ã æ§ç¯ãã¤ã³ãã¯å¹³é¢ä¸ã®ã©ãã«ã§ãéç½®ã§ãã¾ããç°ãªãå¿è¦ãããªãããã¨ãã°ãå·¦ä¸ããå¹¾ä½å­¦çã«ãåè¥¿ãã®ç¹ã§ããå¿è¦ã¯ããã¾ããã :ref:`IRect` ãªãã¸ã§ã¯ãã«ãä»¥ä¸ã®æ³¨éã¯æå¹ã§ãã ç¾å¨ã®é·æ¹å½¢ã¨rã®å±éã®é·æ¹å½¢ã¨ãªã¢ï¼ä¸¡æ¹ã«å«ã¾ããæå¤§ã®é·æ¹å½¢ï¼ãè¨ç®ãã**ç¾å¨ã®é·æ¹å½¢ãç½®ãæãã¾ã**ãã©ã¡ããã®é·æ¹å½¢ãç©ºã®å ´åãçµæãç©ºã«ãªãã¾ãã*r* ãç¡éã§ããå ´åãããã¯æä½ãè¡ããã¾ãããé·æ¹å½¢ãï¼æ°å­¦çã«ï¼äº¤å·®ãã¦ããªãå ´åãçµæã¯ç¡å¹ã«ãªãã¾ããçµæãæå¹ã§ãç©ºã®å ´åãé·æ¹å½¢ã¯äºãã«è§ã¾ãã¯ä¸é¨ã®å´é¢ã«æ¥è§¦ãã¦ãã¾ãã mï¼è¡åï¼âå¤æç¨ã®è¡åã åè§å½¢ `Quad(rect.tl, rect.tr, rect.bl, rect.br)`ã ç¾å¨ã®é·æ¹å½¢ã¨ *r* ãå«ãæå°ã®é·æ¹å½¢ãè¨ç®ãã**ç¾å¨ã®é·æ¹å½¢ãç½®ãæãã¾ã**ãã©ã¡ããã®é·æ¹å½¢ãç¡éã®å ´åãçµæãç¡éã«ãªãã¾ãã1ã¤ãç©ºã§ããå ´åããã1ã¤ãçµæã¨ãã¦åããã¾ãã ç¾å¨ã®é·æ¹å½¢ã¨ç¹ *p* ãå«ãæå°ã®é·æ¹å½¢ãè¨ç®ãã**ç¾å¨ã®é·æ¹å½¢ãç½®ãæãã¾ã**ãç¡éã®é·æ¹å½¢ã¯å¤æ´ããã¾ãããä¸é£ã®ç¹ãå«ãé·æ¹å½¢ãä½æããã«ã¯ãï¼ç©ºã®ï¼ *pymupdf.Rect(p1, p1)* ããå§ããæ®ãã®ç¹ãé æ¬¡å«ãã¦ãã ããã æ°ãããããã¬ãã«ã®é¢æ°ãè¿½å ãããç¡éã¨æ¨æºã®ç©ºã®åè§å½¢ããã³åè§å½¢ãå®ç¾©ãã¾ãã:meth:`INFINITE_RECT` ãªã©ãåç§ãã¦ãã ããã **ãç¡éãã®ç©å½¢ã¯** ã`x0 = y0 = FZ_MIN_INF_RECT` ããã³ `x1 = y1 = FZ_MAX_INF_RECT` ã§å®ç¾©ãããä»ã®ãã¹ã¦ã®ç©å½¢ãå«ã¿ã¾ããããã¯ä¸»ã«æè¡çãªç®çã§ä½¿ç¨ããã¾ãããã¨ãã°ãé¢æ°å¼ã³åºãã§å½¢å¼çã«å¿è¦ãªç©å½¢å¼æ°ãç¡è¦ããå¿è¦ãããå ´åãªã©ã§ãããã®ç©å½¢ã¯ç©ºã§ã¯ããã¾ããã ãã®ã¯ã©ã¹ã¯Pythonã®ã·ã¼ã±ã³ã¹ãã­ãã³ã«ã«å¾ã£ã¦ãããè¦ç´ ã«ã¯ã¤ã³ããã¯ã¹ãä½¿ç¨ã§ãã¾ããUsing Python Sequences as Arguments in PyMuPDFãåç§ãã¦ãã ãã ãã®ãã­ã¥ã¡ã³ãã¯ |version| ã¾ã§ã®ãã¹ã¦ã®ãã¼ã¸ã§ã³ãå¯¾è±¡ã¨ãã¦ãã¾ãã æ¬¡ã®æ¡ä»¶ãæºããå ´åãè¡åãä½¿ç¨ãã¦é·æ¹å½¢ãå¤æãã**åã®é·æ¹å½¢ãç½®ãæãã¾ã** ï¼é·æ¹å½¢ãç©ºã§ãããç¡éã§ããå ´åãããã¯æä½ãè¡ããã¾ããã åä½ã¯ãã¤ã³ãã§ã72ãã¤ã³ãã1ã¤ã³ãã§ãã ãã¼ã¸ã§ã³ 1.19.* ãã¼ã¸ã§ã³ < 1.19.0 é·æ¹å½¢ã®å¹ã`max(x1 - x0, 0)` ã¨ç­ããã ãã©ã¡ã¼ã¿ã¼ãªãã§ãç©ºã®é·æ¹å½¢ *Rect(0.0, 0.0, 0.0, 0.0)* ãä½æããã¾ãã å·¦ä¸ã® x åº§æ¨ã å³ä¸ã® x åº§æ¨ã å³ä¸ã® y åº§æ¨ã å·¦ä¸ã® y åº§æ¨ã FZ_MIN_INF_RECT <= æ°å¤ <= FZ_MAX_INF_RECT ãããç¡éã®é·æ¹å½¢ã§ããå ´åã¯ `True`ã é·æ¹å½¢ãç©ºã§ããå ´åã¯ `True`ã ãããç¡éã®é·æ¹å½¢ã®å ´åã¯ `True`ã `self * mat = rect` ã¨ãªããããªè¡å `mat` ã§ãããã¨ãã°ããã¼ã¸ã¨ãã¯ã¹ãããã®åº§æ¨éãå¤æããã®ã«ä½¿ç¨ã§ãã¾ãã ä½¿ç¨ä¾ã¯ãã¡ããåç§ãã¦ãã ãã :ref:`RecipesImages_P`  æ°ãã :ref:`Quad` ãããã¯åãååã®åè§å½¢ã¡ã½ããã®ã©ããã¼ã§ããç¡éã®å ´åãç¡éã®åè§å½¢ãè¿ããã¾ãã ãã¹ã¦ã®æ°å¤ x0 > x1 ã¾ãã¯ y1 > y0 ã®ãã¹ã¦ã®ç©å½¢ ç©å½¢ã®ä¸é¨ã§ã å¢çãã³ã¼ãã¼ ä¸é¨ã®yåº§æ¨ å·¦ä¸ã®ç¹ãã·ããã  *bl* å³ä¸ã®ç¹ãã·ããã  *br* åè§å½¢ã®é¢ç©ãè¨ç®ãã¾ãã point_likesããã³rect_likesã®åå«ããã§ãã¯ãã¾ãã éç©ºã®äº¤å·®ããã§ãã¯ãã¾ãã å¥ã®åè§å½¢ã¨ã®å±éé¨åã§ãã åº§æ¨å¤ æå°ã® :ref:`Irect` ãå«ãåè§å½¢ãä½æãã¾ãã ç©º ç¹ãå«ãããã«åè§å½¢ãæ¡å¤§ãã¾ãã å¥ã®åè§å½¢ãå«ãããã«åè§å½¢ãæ¡å¤§ãã¾ãã *round()* ã¡ã½ããã®çµæã¨ç­ãã ç¡é å·¦ä¸ã®xåº§æ¨ åè§å½¢ãæå¹ã«ãã¾ã ãªã åè§å½¢ã®é«ã åè§å½¢ã®å¹ å³ä¸ã®è§ã¨ã¨ãã¸ã¯ **å¤å´ã«ããã¾ã** å³ä¸ã®xåº§æ¨ ã¦ã¼ã¯ãªãããã«ã  åºå®ãã¤ã³ãã å¥ã®åè§å½¢ã«å¤æããè¡åã§ãã è¡åã ãã§ãã¯ãããªãã¸ã§ã¯ãã ãã§ãã¯ããé·æ¹å½¢ã å¤æãããåã®é·æ¹å½¢ãå«ãæå°ã®é·æ¹å½¢ã ã¿ã¼ã²ããã®é·æ¹å½¢ãç©ºã¾ãã¯ç¡éã§ãã£ã¦ã¯ããã¾ããã ä¸é¨ã®yåº§æ¨ å·¦ä¸ã®ç¹ãã·ããã  *tl* å³ä¸ã®ç¹ãã·ããã  *tr* è¡åã§åè§å½¢ãå¤å½¢ãã¾ãã ç¹ã¨è¡åãä½¿ç¨ãã¦åè§å½¢ãå¤å½¢ãã¾ãã æå¹ åè§å½¢ãç©ºãã©ãã åè§å½¢ãç¡éãã©ãã åè§å½¢ãæå¹ãã©ãã x0 <= x1 ãã¤ y0 <= y1 x0 = x1 ã¾ãã¯ y0 = y1 x0 >= x1 ã¾ãã¯ y0 >= y1 â ç¡å¹ãªç©å½¢ãå«ã 