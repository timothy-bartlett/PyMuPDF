Þ          ´               L     M     ê  ¸   ö  !   ¯     Ñ     å  ª      Ç   «  x  s  u   ì     b     æ     j     ë       0     H   L         ²  ¸   O
              *     I     a  ß     ð   `  ¶  Q  v     ¤     ¢   $  ­   Ç  '   u       B   ¶  `   ù     Z   A big **thank you** to our user `@kurokawaikki <https://github.com/kurokawaikki>`_, who contributed the following script to **circumvent this restriction**. Annotations As an overview for these capabilities, look at the following script that fills a PDF page with most of the available annotations. Look in the next sections for more special situations: How to Add and Modify Annotations How to Use FreeText How to Use Ink Annotations In PyMuPDF, new annotations can be added via :ref:`Page` methods. Once an annotation exists, it can be modified to a large extent using methods of the :ref:`Annot` class. In contrast to many other tools, initial insert of annotations happens with a minimum number of properties. We leave it to the programmer to e.g. set attributes like author, creation date or subject. Ink annotations are used to contain freehand scribbling. A typical example may be an image of your signature consisting of first name and last name. Technically an ink annotation is implemented as a **list of lists of points**. Each point list is regarded as a continuous line connecting the points. Different point lists represent independent line segments of the annotation. PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. Since MuPDF v1.16, 'FreeText' annotations no longer support bold or italic versions of the Times-Roman, Helvetica or Courier fonts. The following script creates an ink annotation with two mathematical curves (sine and cosine function graphs) as line segments:: The result looks like this: This is the result: This script should lead to the following output: This script shows a couple of ways to deal with 'FreeText' annotations:: Using Buttons and JavaScript Project-Id-Version: PyMuPDF 1.23.0rc1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-09-28 14:54+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Suzan Sanver <suzan.sanver@dijipiji.com>
Language: ja
Language-Team: ja <suzan.sanver@dijipiji.com>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.10.3
 ãã®å¶éãåé¿ããããã«ãæ¬¡ã®ã¹ã¯ãªãããæä¾ãã¦ãããã¦ã¼ã¶ã¼ `@kurokawaikki <https://github.com/kurokawaikki>`_ ããã«å¿ããæè¬ãã¾ãã æ³¨é ãããã®æ©è½ã®æ¦è¦ã«ã¤ãã¦ã¯ãæ¬¡ã®ã¹ã¯ãªãããåç§ãã¦ãã ããããã®ã¹ã¯ãªããã¯PDFãã¼ã¸ã«å©ç¨å¯è½ãªæ³¨éã®ã»ã¨ãã©ãåãããã®ã§ããããç¹æ®ãªç¶æ³ã«ã¤ãã¦ã¯ãæ¬¡ã®ã»ã¯ã·ã§ã³ããè¦§ãã ããã æ³¨éã®è¿½å ã¨å¤æ´æ¹æ³ FreeTextã®ä½¿ç¨æ¹æ³ ã¤ã³ã¯æ³¨éã®ä½¿ç¨æ¹æ³ PyMuPDFã§ã¯ãæ°ããæ³¨éã :ref:`Page` ã¡ã½ãããä»ãã¦è¿½å ãããã¨ãã§ãã¾ããä¸åº¦æ³¨éãå­å¨ããã¨ã :ref:`Annot` ã¯ã©ã¹ã®ã¡ã½ãããä½¿ç¨ãã¦å¤§å¹ã«å¤æ´ã§ãã¾ãã ä»ã®å¤ãã®ãã¼ã«ã¨ã¯ç°ãªããæ³¨éã®åææ¿å¥ã¯æå°éã®ãã­ããã£ã§è¡ããã¾ããä¾ãã°ãèèãä½ææ¥ããµãã¸ã§ã¯ããªã©ã®å±æ§ããã­ã°ã©ãã¼ãè¨­å®ãããã¨ãã§ãã¾ãã ã¤ã³ã¯æ³¨éã¯ãèªç±ãªææ¸ãã®è½æ¸ããå«ãããã«ä½¿ç¨ããã¾ããå¸åçãªä¾ã¨ãã¦ãååã¨å§ãããªãç½²åã®ç»åãæãããã¾ããæè¡çã«ã¯ãã¤ã³ã¯æ³¨éã¯ç¹ã®ãªã¹ãã®ãªã¹ãã¨ãã¦å®è£ããã¾ããåç¹ã®ãªã¹ãã¯ãç¹ãçµãã é£ç¶çãªç·ã¨è¦ãªããã¾ããç°ãªãç¹ã®ãªã¹ãã¯ãæ³¨éã®ç¬ç«ããç·ã»ã°ã¡ã³ããè¡¨ãã¾ãã PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã MuPDF v1.16ä»¥éã'FreeText'æ³¨éã¯ãã¯ãTimes-RomanãHelveticaãCourierãã©ã³ãã®å¤ªå­ãæä½ãã¼ã¸ã§ã³ããµãã¼ããã¦ãã¾ããã ä»¥ä¸ã®ã¹ã¯ãªããã¯ãäºã¤ã®æ°å­¦çãªæ²ç·ï¼æ­£å¼¦é¢æ°ã¨ä½å¼¦é¢æ°ã®ã°ã©ãï¼ãç·ã»ã°ã¡ã³ãã¨ãã¦æã¤ã¤ã³ã¯æ³¨éãä½æãã¾ã:: çµæã¯æ¬¡ã®ããã«ãªãã¾ãã ãããçµæã§ãï¼ ãã®ã¹ã¯ãªããã¯æ¬¡ã®ãããªåºåãçæãã¾ãï¼ ãã®ã¹ã¯ãªããã¯ã'FreeText'æ³¨éãæ±ãããã¤ãã®æ¹æ³ãç¤ºãã¦ãã¾ã:: ãã¿ã³ã¨JavaScriptã®ä½¿ç¨ 