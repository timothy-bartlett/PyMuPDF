Þ    =                    ì     í     ý       	        )  +   2  	   ^     h  	   y                ±     Ä  a   Ñ     3     E  	   N  ¬   X  ý     '       +  e   ¬  V   	  /   i	  A   	  6   Û	  a   
  k   t
  |   à
  5   ]  .        Â  
   Þ  m  é  ¿   W  u                 /  ¢   ³     V     f  E        K  d   d  A   É       7        É  
   V     a  "   |  :     r   Ú     M  "   _  
          /   ¤     Ô    â       &        ­     ¿     Ñ  ;   æ     "     .     ?     Q     p  #        ²  v   Ç  $   >  	   c     m  â   y  r  \  o  Ï  ±   ?     ñ     }  N   ý  t   L  G   Á     	         °   !  K   É!     "     2"     Q"  Ü  m"    J$  v   c%     Ú%  ;  ù%  ¤   5(  ÷   Ú(     Ò)  á   å)  ^   Ç*  *   &+     Q+  _   Ñ+  µ   1,  h   ç,  ¾   P-     .     (.  *   C.  ?   n.     ®.     6/  1   R/     /  3   /  N   Ë/     0   **Description** **KB size** per page. **KB/page** **Links** **Name** **Name** of the file and download **link**. **Notes** **Observations** **Pages** **Rate compared to PyMuPDF** **Size (bytes)** **Size** in bytes. **TOC size** **Textsize per page** is the amount text in the whole file in KB, divided by the number of pages. **Textsize/page** **Tool** **Total** **adobe.pdf** and **pymupdf.pdf** are clearly text oriented, **artifex-website.pdf** and **sample-50-MB-pdf-file.pdf** are graphics oriented. Other files are a mix of both. :ref:`Document Copying<app4_copying>` - This includes opening and parsing :title:`PDFs`, then writing them to an output file. Because the same basic activities are also used for joining (merging) :title:`PDFs`, the results also apply to these use cases. :ref:`Page Rendering<app4_page_rendering>` - This converts |PDF| pages to image files looking identical to the pages. This ability is the basic prerequisite for using a tool in :title:`Python GUI` scripts to scroll through documents. We have chosen a medium-quality (resolution 150 DPI) version. :ref:`Text Extraction<app4_text_extraction>` - This extracts plain text from :title:`PDFs` and writes it to an output text file. A :title:`Python` package similar to :title:`PDFrw`, but based on :title:`C++` library :title:`QPDF`. A :title:`Python` package specialized on rendering |PDF| pages to :title:`JPG` images. A command line utility with multiple functions. A pure :title:`Python` to extract text and other data from |PDF|. A pure :title:`Python` tool with a large function set. A pure :title:`Python` tool, being used by :title:`rst2pdf`, has interface to :title:`ReportLab`. A set of eight files is used for the performance testing. With each file we have the following information: All tools are either platform independent, or at least can run on both, :title:`Windows` and :title:`Unix` / :title:`Linux`. Any **notes** to generally describe the type of file. Appendix 4: Performance Comparison Methodology Copying / Joining / Merging Files used How fast is a |PDF| file read and its content parsed for further processing? The sheer parsing performance cannot directly be compared, because batch utilities always execute a requested task completely, in one go, front to end. :title:`PDFrw` too, has a *lazy* strategy for parsing, meaning it only parses those parts of a document that are required in any moment. In each section, the same fixed set of |PDF| files is being processed by a set of tools. The set of tools used per performance aspect however varies, depending on the supported tool features. PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript Page Rendering Please note that in all cases the actual speed in dealing with |PDF| structures is not directly measured: instead, the timings also include the durations of writing files to the operating system's file system. This cannot be avoided because tools other than |PyMuPDF| do not offer the option to e.g., separate the image **creation** step from the following step, which **writes** the image into a file. PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. So all timings documented include a common, OS-oriented base effort. Therefore, performance **differences per tool are actually larger** than the numbers suggest. Text Extraction The following table shows plain text extraction durations. All tools have been used with their most basic functionality - i.e. no layout re-arrangements, etc. The following three sections deal with different performance aspects: The tool of this manual. These are our run time findings in **seconds** along with a base rate summary compared to |PyMuPDF|: These are the :title:`Python` commands for how each tool is used: This article documents the approach to measure :title:`PyMuPDF's` performance and the tools and example files used to do comparisons. This documentation covers all versions up to |version|. To find an answer to the question, we therefore measure the time to copy a |PDF| file to an output file with each tool, and do nothing else. Tools used Total number of **links**. Total number of **pages** in file. Total number of bookmarks (**Table of Contents** entries). We have tested rendering speed of |PyMuPDF| against :title:`pdf2jpg` and :title:`XPDF` at a resolution of 150 DPI, graphics oriented linearized, many links / bookmarks many pages mix of text & graphics single page, graphics oriented, large file size text oriented Project-Id-Version: PyMuPDF 1.23.0rc1
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
 èª¬æ ãã¼ã¸ãã¨ã® **KBãµã¤ãº** ã **KB/ãã¼ã¸**  **ãªã³ã¯æ°**  **ãã¡ã¤ã«å**  ãã¡ã¤ã« **å** ã¨ãã¦ã³ã­ã¼ã **ãªã³ã¯**ã **ã¡ã¢**  **è¦³å¯çµæ** **ãã¼ã¸æ°**  **PyMuPDFã«å¯¾ããæ¯ç**  **ãµã¤ãºï¼ãã¤ãï¼**  ãã¤ãåä½ã® **ãµã¤ãº**ã **ç®æ¬¡ãµã¤ãº**  **ãã¼ã¸ãã¨ã®ãã­ã¹ããµã¤ãº** ã¯ããã¡ã¤ã«å¨ä½ã®ãã­ã¹ãéãKBã§å²ã£ããã®ã§ãã **ãã­ã¹ããµã¤ãº/ãã¼ã¸**  ãã¼ã« **åè¨**  **adobe.pdf** ã¨ **pymupdf.pdf** ã¯æããã«ãã­ã¹ãå¿åã§ããartifex-website.pdf ã¨ **sample-50-MB-pdf-file.pdf** ã¯ã°ã©ãã£ãã¯ã¹å¿åã§ãããã®ä»ã®ãã¡ã¤ã«ã¯ä¸¡æ¹ã®ããã¯ã¹ã§ãã :ref:`ãã­ã¥ã¡ã³ãã®ã³ãã¼<app4_copying>` - ããã«ã¯ |PDF| ãã¡ã¤ã«ã®ééã¨è§£æãããã¦ããããåºåãã¡ã¤ã«ã«æ¸ãè¾¼ãä½æ¥­ãå«ã¾ãã¾ããåãåºæ¬çãªã¢ã¯ãã£ããã£ã¯ã|PDF| ãã¡ã¤ã«ã®çµåï¼ãã¼ã¸ï¼ã«ãä½¿ç¨ããããããçµæã¯ãããã®ã¦ã¼ã¹ã±ã¼ã¹ã«ãé©ç¨ããã¾ãã :ref:`ãã¼ã¸ã¬ã³ããªã³ã°<app4_page_rendering>` - ããã«ããPDFãã¼ã¸ããã¼ã¸ã¨åããããªè¦ãç®ã®ç»åãã¡ã¤ã«ã«å¤æããã¾ãããã®æ©è½ã¯ã:title:`Python GUI` ã¹ã¯ãªããã§ãã­ã¥ã¡ã³ããã¹ã¯ã­ã¼ã«ããããã®åºæ¬çãªåææ¡ä»¶ã§ããä¸­ç»è³ªçï¼è§£ååº¦150 DPIï¼ãé¸æãã¾ããã :ref:`ãã­ã¹ãæ½åº<app4_text_extraction>` - ããã«ãã |PDF| ãã¡ã¤ã«ããå¹³æãã­ã¹ããæ½åºããããã­ã¹ããã¡ã¤ã«ã«æ¸ãè¾¼ã¾ãã¾ãã :title:`C++` ã©ã¤ãã©ãª :title:`QPDF` ã«åºã¥ãã :title:`Python` ããã±ã¼ã¸ã§ã :title:`PDFrw` ã«é¡ä¼¼ãã¦ãã¾ãã |PDF| ãã¼ã¸ã :title:`JPG` ç»åã«ã¬ã³ããªã³ã°ãããã¨ã«ç¹åãã :title:`Python` ããã±ã¼ã¸ã§ãã è¤æ°ã®æ©è½ãåããã³ãã³ãã©ã¤ã³ã¦ã¼ãã£ãªãã£ã§ãã |PDF| ãããã­ã¹ãããã®ä»ã®ãã¼ã¿ãæ½åºããããã®ç´ç²ãª :title:`Python` ãã¼ã«ã§ãã å¤ãã®æ©è½ãåããç´ç²ãª :title:`Python` ãã¼ã«ã§ãã :title:`rst2pdf` ã§ä½¿ç¨ãããç´ç²ãª :title:`Python` ãã¼ã«ã§ãReportLabã¨ã®ã¤ã³ã¿ã¼ãã§ã¼ã¹ãæã£ã¦ãã¾ãã æ§è½ãã¹ãã«ã¯ã8ã¤ã®ãã¡ã¤ã«ã»ãããä½¿ç¨ããã¾ããåãã¡ã¤ã«ã«ã¯ãæ¬¡ã®æå ±ãããã¾ãï¼ ãã¹ã¦ã®ãã¼ã«ã¯ããã©ãããã©ã¼ã ã«ä¾å­ããªãããå°ãªãã¨ã :title:`Windows` ã¨ :title:`Unix` / :title:`Linux` ã®ä¸¡æ¹ã§å®è¡ã§ãã¾ãã ãã¡ã¤ã«ã®ã¿ã¤ããä¸è¬çã«èª¬æããããã® **ã¡ã¢** ã ä»é²4ï¼æ§è½æ¯è¼æ¹æ³ ã³ãã¼ / çµå / ãã¼ã¸ ä½¿ç¨ããããã¡ã¤ã« |PDF| ãã¡ã¤ã«ã®èª­ã¿åãããã³ãã®ã³ã³ãã³ãã®è§£æã¯ãã©ãã ãé«éã«è¡ãããã®ã§ããããï¼ç´ç²ãªè§£æã®æ§è½ãç´æ¥æ¯è¼ãããã¨ã¯ã§ãã¾ããããªããªãããããã¦ã¼ãã£ãªãã£ã¯å¸¸ã«è¦æ±ãããã¿ã¹ã¯ãä¸åº¦ã«å®å¨ã«å®è¡ããããã§ãã :title:`PDFrw` ãè§£æã®éã«ã¯ *ã¬ã¤ã¸ã¼* ãªæ¦ç¥ãæ¡ç¨ãã¦ãããå¿è¦ãªç¬éã«å¿è¦ãªé¨åã®ã¿ãè§£æãã¾ãã åã»ã¯ã·ã§ã³ã§ã¯ãåãåºå®ãããã»ããã® |PDF| ãã¡ã¤ã«ãä¸é£ã®ãã¼ã«ã«ãã£ã¦å¦çããã¾ãããã ããæ§è½ã®å´é¢ãã¨ã«ä½¿ç¨ããããã¼ã«ã®ã»ããã¯ããµãã¼ãããããã¼ã«ã®æ©è½ã«å¿ãã¦ç°ãªãã¾ãã PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript ãã¼ã¸ã®ã¬ã³ããªã³ã° |PDF| æ§é ã®å¦çéåº¦ãã®ãã®ãç´æ¥æ¸¬å®ããã®ã§ã¯ãªãããã¹ã¦ã®å ´åã«ããã¦ãã¿ã¤ãã³ã°ã«ã¯ãã¡ã¤ã«ããªãã¬ã¼ãã£ã³ã°ã·ã¹ãã ã®ãã¡ã¤ã«ã·ã¹ãã ã«æ¸ãè¾¼ãæéãå«ã¾ãããã¨ã«æ³¨æãã¦ãã ãããããã¯åé¿ã§ããªãè¦å ã§ãããªããªãã|PyMuPDF| ä»¥å¤ã®ãã¼ã«ã§ã¯ãä¾ãã°ã¤ã¡ã¼ã¸ã® **ä½æ** ã¹ãããã¨ãã¤ã¡ã¼ã¸ããã¡ã¤ã«ã« **æ¸ãè¾¼ã** å¾ç¶ã®ã¹ããããåé¢ãããªãã·ã§ã³ãæä¾ããã¦ããªãããã§ãã PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã ãããã£ã¦ããã¹ã¦ã®è¨é²ãããã¿ã¤ãã³ã°ã«ã¯å±éã®OSæåã®åºæ¬çãªåªåãå«ã¾ãã¦ãã¾ãããããã£ã¦ã**ãã¼ã«ãã¨ã®æ§è½ã®éãã¯ãæ°å­ãç¤ºãä»¥ä¸ã«å®éã«ã¯å¤§ããã§ã** ã ãã­ã¹ãæ½åº ä»¥ä¸ã®è¡¨ã¯ããã¬ã¼ã³ãã­ã¹ãã®æ½åºã«ãããæéãç¤ºãã¦ãã¾ãããã¹ã¦ã®ãã¼ã«ã¯ãåºæ¬çãªæ©è½ã®ã¿ãä½¿ç¨ãã¦ãã¾ã - ã¬ã¤ã¢ã¦ãã®åéç½®ãªã©ã¯ããã¾ããã ä»¥ä¸ã®3ã¤ã®ã»ã¯ã·ã§ã³ã§ã¯ãç°ãªãæ§è½ã®å´é¢ã«åãçµãã§ãã¾ãï¼ ãã®ããã¥ã¢ã«ã®ãã¼ã«ã§ãã ä»¥ä¸ã¯ãå®è¡æéã®çµæï¼ **ç§åä½**ï¼ã¨ã |PyMuPDF| ã¨ã®æ¯è¼ã«ãããåºæ¬ã¬ã¼ãã®è¦ç´ã§ãï¼ åãã¼ã«ã®ä½¿ç¨æ¹æ³ã«é¢ãã :title:`Python` ã³ãã³ãã¯ä»¥ä¸ã®éãã§ãï¼ ãã®è¨äºã§ã¯ã|PyMuPDF| ã®æ§è½ãæ¸¬å®ããã¢ãã­ã¼ãã¨ãæ¯è¼ãè¡ãããã«ä½¿ç¨ããããã¼ã«ã¨ãµã³ãã«ãã¡ã¤ã«ã«ã¤ãã¦èª¬æãã¾ãã ãã®ãã­ã¥ã¡ã³ãã¯ |version| ã¾ã§ã®ãã¹ã¦ã®ãã¼ã¸ã§ã³ãå¯¾è±¡ã¨ãã¦ãã¾ãã ãããã£ã¦ããã®è³ªåã«ç­ããããã«ãåãã¼ã«ã§ |PDF| ãã¡ã¤ã«ãåºåãã¡ã¤ã«ã«ã³ãã¼ããæéãè¨æ¸¬ããããä»¥å¤ã®æä½ã¯è¡ãã¾ããã ä½¿ç¨ããããã¼ã« **ãªã³ã¯** ã®ç·æ°ã ãã¡ã¤ã«åã®ç· **ãã¼ã¸** æ°ã ããã¯ãã¼ã¯ï¼ **ç®æ¬¡** ã¨ã³ããªã¼ï¼ã®ç·æ°ã ç§ãã¡ã¯ãè§£ååº¦150 DPIã§ |PyMuPDF| ã®ã¬ã³ããªã³ã°éåº¦ã :title:`pdf2jpg` ã¨ :title:`XPDF` ã¨æ¯è¼ãã¾ããã ã°ã©ãã£ãã¯ã¹å¿å ç·å½¢åãå¤ãã®ãªã³ã¯/ããã¯ãã¼ã¯ å¤ãã®ãã¼ã¸ ãã­ã¹ãã¨ã°ã©ãã£ãã¯ã¹ã®ããã¯ã¹ åä¸ãã¼ã¸ãã°ã©ãã£ãã¯ã¹å¿åãå¤§ããªãã¡ã¤ã«ãµã¤ãº ãã­ã¹ãå¿å 