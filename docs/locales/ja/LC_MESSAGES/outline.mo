Þ          Ü                         «     Â    Ø  Q   d  n  ¶     %     ¿  u   Ç     =  '   Á  $   é  e     P   t  2   Å     ø     	     !	  $   7	  (   \	     	     	  *   £	    Î	     k     |       7  §  c   ß  "  C  â   f     I  v   f  ¤   Ý  D     3   Ç     û  k     O   ÿ     O     h  %     *   ­  E   Ø  9        X  K   e   **Class API** **Method / Attribute** **Short Description** *outline* (or "bookmark"), is a property of *Document*. If not *None*, it stands for the first outline item of the document. Its properties in turn define the characteristics of this item and also point to other outline items in "horizontal" or downward direction. The full tree of all outline items for e.g. a conventional table of contents (TOC) can be recovered by following these "pointers". A bool specifying whether the target is outside (*True*) of the current document. A string specifying the link target. The meaning of this property should be evaluated in conjunction with *isExternal*. The value may be *None*, in which case *isExternal == False*. If *uri* starts with *file://*, *mailto:*, or an internet resource name, *isExternal* is *True*. In all other cases *isExternal == False* and *uri* points to an internal location. In case of PDF documents, this should either be *#nnnn* to indicate a 1-based (!) page number *nnnn*, or a named location. The format varies for other document types, e.g. *uri = '../FixedDoc.fdoc#PG_21_LNK_84'* for page number 21 (1-based) in an XPS document. Indicator showing whether any sub-outlines should be expanded (*True*) or be collapsed (*False*). This information is interpreted by PDF reader software. Outline PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. The item's title as a string or *None*. The link destination details object. The next outline item at the same level as this item. Is *None* if this is the last one in its level. The next outline item on the next level down. Is *None* if the item has no kids. The page number (0-based) this bookmark points to. next item downwards next item same level page number (0-based) points to destination details object string further specifying outline target target outside document title whether sub-outlines are open or collapsed Project-Id-Version: PyMuPDF 1.23.0rc1
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
 **ã¯ã©ã¹API** **ã¡ã½ãã / å±æ§** **ç­ãèª¬æ** *ã¢ã¦ãã©ã¤ã³*ï¼ã¾ãã¯ãããã¯ãã¼ã¯ãï¼ã¯ã*Document* ã®ãã­ããã£ã§ããããã *None* ã§ãªãå ´åãããã¯ãã­ã¥ã¡ã³ãã®æåã®ã¢ã¦ãã©ã¤ã³é ç®ãè¡¨ãã¾ãããã®ãã­ããã£ã¯ããã®é ç®ã®ç¹æ§ãå®ç¾©ããã¾ããæ°´å¹³ãã¾ãã¯ä¸åãã®æ¹åã«ä»ã®ã¢ã¦ãã©ã¤ã³é ç®ãæãã¾ãããã¨ãã°ãéå¸¸ã®ç®æ¬¡ï¼TOCï¼ã®ããã®ãã¹ã¦ã®ã¢ã¦ãã©ã¤ã³é ç®ã®å®å¨ãªããªã¼ã¯ããããã®ããã¤ã³ã¿ã¼ãããã©ããã¨ã§åå¾©ã§ãã¾ãã å¯¾è±¡ãç¾å¨ã®ãã­ã¥ã¡ã³ãã®å¤é¨ï¼*True*ï¼ãã©ãããç¤ºããã¼ã«å¤ã§ãã ãªã³ã¯ã®ã¿ã¼ã²ãããæå®ããæå­åã§ãããã®ãã­ããã£ã®æå³ã¯ *isExternal* ã¨é£åãã¦è©ä¾¡ãããã¹ãã§ããå¤ã *None* ã®å ´åã*isExternal == False* ã§ãã*uri* ã *file://ãmailto:* ãã¾ãã¯ã¤ã³ã¿ã¼ããããªã½ã¼ã¹åã§å§ã¾ãå ´åã*isExternal* ã¯ *True* ã§ããããä»¥å¤ã®å ´åã*isExternal == False* ã§ã*uri* ã¯åé¨ã®å ´æãæãã¾ããPDFãã­ã¥ã¡ã³ãã®å ´åãããã¯1ããå§ã¾ããã¼ã¸çªå· *nnnn* ãç¤ºãããã® *#nnnn* ã§ããããååä»ãã®å ´æã§ããå¿è¦ãããã¾ããä»ã®ãã­ã¥ã¡ã³ãã¿ã¤ãã®å ´åãä¾ãã°XPSãã­ã¥ã¡ã³ãã®å ´åã*uri = '../FixedDoc.fdoc#PG_21_LNK_84'* ã¯ããã¼ã¸çªå·21ï¼1ããå§ã¾ãï¼ãç¤ºãã¾ãã ãµãã¢ã¦ãã©ã¤ã³ãå±éãããã¹ããï¼*True*ï¼æãããã¾ããã¹ããï¼*False*ï¼ãç¤ºãã¤ã³ã¸ã±ã¼ã¿ã¼ã§ãããã®æå ±ã¯PDFãªã¼ãã¼ã½ããã¦ã§ã¢ã«ãã£ã¦è§£éããã¾ãã Outline (ã¢ã¦ãã©ã¤ã³) PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã ã¢ã¤ãã ã®ã¿ã¤ãã«ãã¾ãã¯ *None* ã®æå­åã§ãã ãªã³ã¯ã®å®åè©³ç´°ãªãã¸ã§ã¯ãã§ãã ãã®ã¢ã¤ãã ã¨åãã¬ãã«ã®æ¬¡ã®ã¢ã¦ãã©ã¤ã³é ç®ã§ãããã®ã¢ã¤ãã ããã®ã¬ãã«ã§æå¾ã®å ´åã*None* ã§ãã æ¬¡ã®éå±¤ã®ã¢ã¦ãã©ã¤ã³é ç®ã§ããã¢ã¤ãã ã«å­è¦ç´ ããªãå ´åã¯ *None* ã§ãã ãã®ããã¯ãã¼ã¯ãæããã¼ã¸çªå·ï¼0ããå§ã¾ãï¼ã§ãã æ¬¡ã®é ç®ã¯ä¸åã åãã¬ãã«ã®æ¬¡ã®é ç® ãã¼ã¸çªå·ï¼0ããå§ã¾ãï¼ å®åã®è©³ç´°ãªãã¸ã§ã¯ããæã ã¢ã¦ãã©ã¤ã³ã®ã¿ã¼ã²ãããããã«æå®ããæå­å ãã­ã¥ã¡ã³ãã®å¤é¨ã®ã¿ã¼ã²ãããã©ãã ã¿ã¤ãã« ãµãã¢ã¦ãã©ã¤ã³ãéãã¦ãããæãããã¾ãã¦ããã 