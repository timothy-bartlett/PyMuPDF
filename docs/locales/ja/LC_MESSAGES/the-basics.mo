Þ    u      Ä              l     m  f        æ  4   ü  4   1     f  0   |  i   ­     	     	     ±	     Ï	  Ð   ê	  U   »
  ¬     Í   ¾  ¹        F     Ç     Þ     ÷               %     .     J     d  &   |  r   £       H     '   ã       X     j   w    â  !   î  ¢    H   ³     ü  ,     o   =  ^   ­  Ö     Ä   ã     ¨  P   ·      u     \        ñ     u        /  ©     Ù     ê       ^     [   ô     P  ~   g  @   æ  z   '  ¯   ¢  
   R  ï   ]  °   M  b  þ  |   a!     Þ!  ã   k"     O#  q   æ#  ê   X$  º   C%  g   þ%    f&  Ò   '  "  U(  7   x)  _   °)  ±   *  Q   Â*  ·   +  °   Ì+  &   },  .   ¤,  5   Ó,  F   	-  3   P-  I   -      Î-  @   ï-  =   0.  3   n.  0   ¢.  >   Ó.  <   /  J   O/  '   /  !   Â/  "   ä/  B   0  â   J0      -1  G   Î1  ú  2     4  Ô   4     q5  N   5     Ù5     ø5     6     6     96    W6     ô7  l   8     {8  :   8  @   Ê8     9  U   !9  ~   w9  ´   ö9  !   «:  ?   Í:     ;    ,;  k   5<  ê   ¡<  ê   =  ý   w>  ¸   u?  !   .@     P@     p@     @     ¥@     ¾@  !   Ã@  '   å@  *   A  '   8A  ¨   `A     	B  \   B  9   ùB     3C     OC  ·   ØC  U  D  6   æE  [  F  j   yH     äH  <    I     =I     ÌI  Ç   TJ  >  K     [L     qL  D  ûL  v   @N     ·N  ¤   8O     ÝO  /   ùO  b  )P     Q  Ô   ¥Q     zR  |   R     S  !   ¢S  ¥   ÄS  X   jT  «   ÃT  ÿ   oU     oV  @  vV    ·W  Õ  ÏX  ­   ¥Z  Ç   S[  <  \  ¹   X]     ^  N  ±^  Ì    `  o   Í`    =a  .  ]b  |  c  h   	e  ¢   re  í   f  u   g  Î   yg  Ï   Hh  K   i  W   di  m   ¼i     *j  c   µj  Q   k  Q   kk     ½k  c   @l  Z   ¤l  Z   ÿl  ]   Zm  u   ¸m     .n  W   ¹n  K   o  N   ]o  ~   ¬o  @  +p  Ã   lq  {   0r  ¤  ¬r  ­   Qu  G  ÿu     Gw  c   Ww  $   »w     àw     ùw     x     (x   **API reference** **Decrypting** will automatically happen on save as before when no encryption parameters are provided. **Taking it further** :index:`Attaching Files <triple: attach;embed;file>` :index:`Embedding Files <triple: attach;embed;file>` :meth:`Page.get_text` A PDF document may have two different passwords: A bookmark (entry in the Table of Contents) will become inactive and will no longer navigate to any page. A hyperlink will be removed from the page that contains it. The visible content on that page will not otherwise be changed in any way. Adding Blank Pages Adding a watermark to a |PDF| Adding an image to a |PDF| Adding watermarks is essentially as simple as adding an image at the base of each |PDF| page. You should ensure that the image has the required opacity and aspect ratio to make it look the way you need it to. Annotations (:ref:`Annot`) on pages can be retrieved with the `page.annots()` method. Another example could be redacting an area of a page, but not to redact any line art (i.e. vector graphics) within the defined area, by setting a parameter flag as follows: As with :ref:`attaching files<The_Basics_Attaching_Files>`, when adding the file with :meth:`Document.embfile_add` note that the first parameter for the `filename` should include the actual file extension. As with the watermark example you should ensure to be more performant by only referencing the image once if possible - see the code example and explanation on :meth:`Page.insert_image`. Check whether a document is password protected / (still) encrypted (:attr:`Document.needs_pass`, :attr:`Document.is_encrypted`). Combining Single Pages Converting PDF Documents Copying Pages Cropping a |PDF| Deleting Pages Example: Extract images from a |PDF| Extract text from a |PDF| Extract vector graphics Extracting Tables from a :title:`Page` For example if we wanted to redact all instances of the name "Jane Doe" from a document we could do the following: For more information also have a look at this Wiki `article <https://github.com/pymupdf/PyMuPDF/wiki/Rearranging-Pages-of-a-PDF>`_. Gain access authorization to a document (:meth:`Document.authenticate`). Getting All Annotations from a Document Getting Page Links Here is a 3-liner that creates a |PDF|: with one empty page. Its file size is 460 bytes: If your document contains image based text content the use OCR on the page for subsequent text extraction: In the example above a new image is created from each file reference, but to be more performant (by saving memory and file size) this image data should be referenced only once - see the code example and explanation on :meth:`Page.insert_image` for the implementation. Inserting Pages with Text Content It is easy to join PDFs with :meth:`Document.insert_pdf` & :meth:`Document.insert_file`. Given open |PDF| documents, you can copy page ranges from one to the other. You can select the point where the copied pages should be placed, you can revert the page sequence and also change page rotation. This Wiki `article <https://github.com/pymupdf/PyMuPDF/wiki/Inserting-Pages-from-other-PDFs>`_ contains a full description. Links can be extracted from a :ref:`Page` to return :ref:`Link` objects. Merging |PDF| files Merging |PDF| files with other types of file Method :meth:`Document.authenticate` will automatically establish access rights according to the password used. Now let's prepare a PDF for double-sided printing (on a printer not directly supporting this): Of course it is not just |PDF| which can have text extracted - all the :ref:`supported document file formats <About_Feature_Matrix>` such as :title:`MOBI`, :title:`EPUB`, :title:`TXT` can have their text extracted. Once a redacted version of a document is saved then the redacted content in the **PDF** is *irretrievable*. Thus, a redacted area in a document removes text and graphics completely from that area. Opening a File Opening this document with some viewer (Nitro Reader 5) reflects these settings: Or you alternatively prepare a complete new page layout in form of a :title:`Python` sequence, that contains the page numbers you want, in the sequence you want, and as many times as you want each page. The following may illustrate what can be done with :meth:`Document.select` PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript Please refer to: :ref:`How to Extract Drawings<RecipesDrawingAndGraphics_Extract_Drawings>`. PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. Re-Arranging Pages Redacting content from a **PDF** Redactions are special types of annotations which can be marked onto a document page to denote an area on the page which should be securely removed. After marking an area with a rectangle then this area will be marked for *redaction*, once the redaction is *applied* then the content is securly removed. Rotating a |PDF| See the :ref:`list of supported file types<Supported_File_Types>` and :ref:`The How to Guide on Opening Files <HowToOpenAFile>` for more advanced options. Selecting Pages Set encryption details for PDF files using :meth:`Document.save` or :meth:`Document.write` and Similarly, `doc.delete_pages(from_page=9, to_page=14)` will delete pages 10 - 15 inclusive. Splitting Single Pages Starting with version 1.16.0, |PDF| decryption and encryption (using passwords) are fully supported. You can do the following: Tables can be found and extracted from any document :ref:`Page`. The **owner password** provides full access rights, including changing passwords, encryption method, or permission detail. The **user password** provides access to document content according to the established permission details. If present, opening the |PDF| in a viewer will require providing it. The Basics The GUI script `join.py <https://github.com/pymupdf/PyMuPDF-Utilities/blob/master/examples/join-documents/join.py>`_ uses this method to join a list of files while also joining the respective table of contents segments. It looks like this: The are a few options for creating and applying redactions to a page, for the full API details to understand the parameters to control these options refer to the API reference. The convenience function :meth:`paper_size` knows over 40 industry standard paper formats to choose from. To see them, inspect dictionary :attr:`paperSizes`. Pass the desired dictionary key to :meth:`paper_size` to retrieve the paper dimensions. Upper and lower case is supported. If you append "-L" to the format name, the landscape version is returned. The default icon for the attachment is by default a "push pin", however you can change this by setting the `icon` parameter. The following example will reverse the order of all pages (**extremely fast:** sub-second time for the 756 pages of the :ref:`AdobeManual`): The following snippet creates a new |PDF| and encrypts it with separate user and owner passwords. Permissions are granted to print, copy and annotate, but no changes are allowed to someone authenticating with the user password. The number of pages is given by `len(doc)` (equal to `doc.page_count`). The following lists represent the even and the odd page numbers, respectively: The page index is zero-based, so to delete page 10 of a document you would do the following `doc.delete_page(9)`. The text parameter can be a (sequence of) string (assuming UTF-8 encoding). Insertion will start at :ref:`Point` (50, 72), which is one inch below top of page and 50 points from the left. The number of inserted text lines is returned. There are many more examples which explain how to extract text from specific areas or how to extract tables from documents. Please refer to the :ref:`How to Guide for Text<RecipesText>`. There is also the `pdf2docx extract tables method`_ which is capable of table extraction if you prefer. There is one *mathematical term* that you should feel comfortable with when using **PyMuPDF** -  **"coordinates"**. Please have a quick look at the :ref:`Coordinates` section to understand the coordinate system to help you with positioning objects and understand your document space. This deals with joining |PDF| pages to form a new |PDF| with pages each combining two or four original ones (also called "2-up", "4-up", etc.). This could be used to create booklets or thumbnail-like overviews. This deals with splitting up pages of a |PDF| in arbitrary pieces. For example, you may have a |PDF| with *Letter* format pages which you want to print with a magnification factor of four: each page is split up in 4 pieces which each going to a separate |PDF| page in *Letter* format again. This documentation covers all versions up to |version|. This snippet creates the respective sub documents which can then be used to print the document: This snippet duplicates the PDF with itself so that it will contain the pages *0, 1, ..., n, 0, 1, ..., n* **(extremely fast and without noticeably increasing the file size!)**: This will return a dictionary of paths for any vector drawings found on the page. To **change the encryption method** specify the full range of options above (`encryption`, `owner_pw`, `user_pw`, `permissions`). An incremental save is **not possible** in this case. To **keep the encryption method** of a PDF save it using `encryption=pymupdf.PDF_ENCRYPT_KEEP`. If `doc.can_save_incrementally() == True`, an incremental save is also possible. To add a blank page, do the following: To add a rotation to a page, do the following: To add a watermark to a |PDF| file, do the following: To add an image to a |PDF| file, for example a logo, do the following: To attach another file to a page, do the following: To change the sequence of pages, i.e. re-arrange pages, do the following: To copy pages, do the following: To crop a page to a defined :ref:`Rect<Rect>`, do the following: To delete a multiple pages from a document, do the following: To delete a page from a document, do the following: To embed a file to a document, do the following: To extract all the images from a |PDF| file, do the following: To extract all the text from a |PDF| file, do the following: To extract all the vector graphics from a document page, do the following: To merge |PDF| files, do the following: To open a file, do the following: To select pages, do the following: Use this to create the page with another pre-defined paper format: Using the :meth:`Document.insert_page` method also inserts a new page and accepts the same `width` and `height` parameters. But it lets you also insert arbitrary text into the new page and returns the number of inserted lines. We recommend the pdf2docx_ library which uses **PyMuPDF** and the **python-docx** library to provide simple document conversion from **PDF** to **DOCX** format. What happens if I delete a page referred to by bookmarks or hyperlinks? When adding the file with :meth:`Page.add_file_annot` note that the third parameter for the `filename` should include the actual file extension. Without this the attachment possibly will not be able to be recognized as being something which can be opened. For example, if the `filename` is just *"attachment"* when view the resulting PDF and attempting to open the attachment you may well get an error. However, with *"attachment.pdf"* this can be recognized and opened by PDF viewers as a valid file type. With :meth:`Document.insert_file` you can invoke the method to merge :ref:`supported files<Supported_File_Types>` with |PDF|. For example: With |PyMuPDF| you have all options to copy, move, delete or re-arrange the pages of a |PDF|. Intuitive methods exist that allow you to do this on a page-by-page level, like the :meth:`Document.copy_page` method. Working with Coordinates You can now also :ref:`extract text in Markdown format<rag_outputting_as_md>`. decrypt or encrypt the content set password(s) set permission details set the encryption method |PDF| Encryption & Decryption Project-Id-Version: PyMuPDF 1.23.0rc1
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
 **APIãªãã¡ã¬ã³ã¹** æå·åãã©ã¡ã¼ã¿ãæä¾ããã¦ããªãå ´åãä¿å­æã«èªåçã«å¾©å·åããã¾ãã **ããã«é²ã** :index:`ãã¡ã¤ã«ã®æ·»ä» <triple: attach;embed;file>` :index:`ãã¡ã¤ã«ãåãè¾¼ã <triple: attach;embed;file>` :meth:`Page.get_text` PDFææ¸ã«ã¯2ã¤ã®ç°ãªããã¹ã¯ã¼ããå­å¨ããå ´åãããã¾ãï¼ ããã¯ãã¼ã¯ï¼ç®æ¬¡ã®ã¨ã³ããªã¼ï¼ã¯ç¡å¹ã«ãªãããã¯ãã©ã®ãã¼ã¸ã«ãããã²ã¼ããã¾ãã ãã¤ãã¼ãªã³ã¯ã¯ããããå«ããã¼ã¸ããåé¤ããã¾ãããã®ãã¼ã¸ã®å¯è¦ã³ã³ãã³ãã¯ãä»ã®æ¹æ³ã§å¤æ´ããããã¨ã¯ããã¾ããã ç©ºç½ã®ãã¼ã¸ãè¿½å ãã |PDF| ãã¡ã¤ã«ã«ã¦ã©ã¼ã¿ãã¼ã¯ãè¿½å ããæ¹æ³ |PDF| ã«ç»åãè¿½å ãã ã¦ã©ã¼ã¿ãã¼ã¯ãè¿½å ãããã¨ã¯ãåºæ¬çã«ã¯åPDFãã¼ã¸ã®åºè¾ºã«ç»åãè¿½å ããã ãã§ããç»åãå¿è¦ãªéæåº¦ã¨ã¢ã¹ãã¯ãæ¯ãæã£ã¦ãããã¨ãç¢ºèªãã¦ãå¿è¦ãªè¦ãç®ã«ãªãããã«ãã¾ãã ãã¼ã¸ä¸ã®æ³¨é (:ref:`Annot`) ã¯ã`page.annots()` ã¡ã½ãããä½¿ç¨ãã¦åå¾ã§ãã¾ãã å¥ã®ä¾ã¨ãã¦ããã¼ã¸ã®é åãå¡ãã¤ã¶ãããå®ç¾©ãããé ååã®ç·ç»ï¼ãã¯ãã«ã°ã©ãã£ãã¯ã¹ï¼ãå¡ãã¤ã¶ããªãããã«ããã©ã¡ã¼ã¿ãã©ã°ãè¨­å®ãããã¨ãã§ãã¾ãã ãã¡ã¤ã«ãæ·»ä»ããå ´åã¨åæ§ã«ã :meth:`Document.embfile_add` ã§ãã¡ã¤ã«ãè¿½å ããéã«ã¯ããã¡ã¤ã«åãæå®ããç¬¬ä¸å¼æ°ã«ã¯å®éã®ãã¡ã¤ã«ã®æ¡å¼µå­ãå«ããå¿è¦ãããã¾ã ã¦ã©ã¼ã¿ãã¼ã¯ã®ä¾ã¨åæ§ã«ãã§ããéãç»åã1åã ãåç§ãããã¨ã§ãããå¹ççãªå¦çãè¡ãããã«ãã¦ãã ãããè©³ç´°ã¯ :meth:`Page.insert_image` ã®ã³ã¼ãä¾ã¨èª¬æãåç§ãã¦ãã ããã ãã­ã¥ã¡ã³ãããã¹ã¯ã¼ãä¿è­·ããã¦ããããï¼ã¾ã ï¼æå·åããã¦ããããç¢ºèªããï¼:attr:`Document.needs_pass`, :attr:`Document.is_encrypted`ï¼ã åä¸ã®ãã¼ã¸ãçµåãã PDF ãã­ã¥ã¡ã³ãã®å¤æ ãã¼ã¸ãã³ãã¼ãã |PDF| ã®ããªãã³ã° ãã¼ã¸ãåé¤ãã ä¾: |PDF| ããç»åãæ½åºãã |PDF| ãããã­ã¹ããæ½åºãã ãã¯ãã«ã°ã©ãã£ãã¯ã¹ãæ½åº ãã¼ã¸ããã®ãã¼ãã«ã®æ½åº ãã¨ãã°ããã­ã¥ã¡ã³ãããååãã¸ã§ã¼ã³ã»ãã¼ãã®ãã¹ã¦ã®ã¤ã³ã¹ã¿ã³ã¹ãå¡ãã¤ã¶ãããå ´åã¯ãæ¬¡ã®ããã«ãã¾ãï¼ è©³ç´°ã«ã¤ãã¦ã¯ããã® `ã¦ã£ã­ã®è¨äº <https://github.com/pymupdf/PyMuPDF/wiki/Rearranging-Pages-of-a-PDF>`_ ããè¦§ãã ããã ãã­ã¥ã¡ã³ãã¸ã®ã¢ã¯ã»ã¹æ¨©ãåå¾ããï¼:meth:`Document.authenticate`ï¼ã ãã­ã¥ã¡ã³ããããã¹ã¦ã®æ³¨éãåå¾ãã ãã¼ã¸ãªã³ã¯ã®åå¾ ä»¥ä¸ã¯ã1ãã¼ã¸ã®ç©ºç½ã® |PDF|: ãä½æããããã®3è¡ã®ã³ã¼ãã§ãããã¡ã¤ã«ãµã¤ãºã¯460ãã¤ãã§ãã ããææ¸ã«ç»åãã¼ã¹ã®ãã­ã¹ãã³ã³ãã³ããå«ã¾ãã¦ããå ´åã¯ãå¾ç¶ã®ãã­ã¹ãæ½åºã®ããã«ãã®ãã¼ã¸ã§OCRãä½¿ç¨ãã¦ãã ããã åè¿°ã®ä¾ã§ã¯ãåãã¡ã¤ã«åç§ããæ°ããç»åãä½æããã¦ãã¾ãããã¡ã¢ãªã¨ãã¡ã¤ã«ãµã¤ãºãç¯ç´ããããã«ããã®ç»åãã¼ã¿ã¯1åã ãåç§ãããããã«ããã¨ãããã©ã¼ãã³ã¹ãåä¸ãã¾ã - Page.insert_image()ã®ã³ã¼ãä¾ã¨èª¬æãåç§ãã¦ãã ããã ãã¼ã¸ã«ãã­ã¹ãã³ã³ãã³ããæ¿å¥ãã :meth:`Document.insert_pdf` ã¨ :meth:`Document.insert_file` ãä½¿ç¨ããã°ãPDFãç°¡åã«çµåã§ãã¾ããéãããPDFææ¸ãããå ´åãçæ¹ã®PDFããå¥ã®PDFã¸ãã¼ã¸ã®ç¯å²ãã³ãã¼ãããã¨ãã§ãã¾ããã³ãã¼ããããã¼ã¸ãéç½®ãããä½ç½®ãé¸æãããã¨ãã§ãããã¼ã¸ã®é åºãåã«æ»ããã¨ãã§ãã¾ããããã«ããã¼ã¸ã®åè»¢ãå¤æ´ãããã¨ãã§ãã¾ããè©³ç´°ãªèª¬æã¯ãã® `Wiki <https://github.com/pymupdf/PyMuPDF/wiki/Inserting-Pages-from-other-PDFs>`_ ã®è¨äºã«è¨è¼ããã¦ãã¾ãã :ref:`Page` ãããªã³ã¯ãæ½åºãã¦ :ref:`Link` ãªãã¸ã§ã¯ããè¿ããã¨ãã§ãã¾ãã |PDF| ãã¡ã¤ã«ã®çµå |PDF| ã¡ã¤ã«ã¨ä»ã®ç¨®é¡ã®ãã¡ã¤ã«ãçµåãã ã¡ã½ãã :meth:`Document.authenticate` ã¯ãä½¿ç¨ããããã¹ã¯ã¼ãã«åºã¥ãã¦èªåçã«ã¢ã¯ã»ã¹æ¨©ãç¢ºç«ãã¾ãã ä»¥ä¸ã®ããã«ãä¸¡é¢å°å·ç¨ã«PDFãæºåãã¾ãããï¼ç´æ¥ããããµãã¼ããã¦ããªãããªã³ã¿ã¼ã§ï¼ï¼ ãã¡ãããPDFã ãã§ãªããMOBIãEPUBãTXTãªã©ã® :ref:`ãµãã¼ãããã¦ãããã­ã¥ã¡ã³ããã¡ã¤ã«å½¢å¼ <About_Feature_Matrix>` ã§ããã­ã¹ããæ½åºã§ãã¾ãã ææ¸ã®å¡ãã¤ã¶ãæ¸ã¿ãã¼ã¸ã§ã³ãä¿å­ããã¨ã**PDF** åã®å¡ãã¤ã¶ãããã³ã³ãã³ãã¯ *åãæ»ããã¨ãã§ããªããªãã¾ã* ããããã£ã¦ãææ¸åã®å¡ãã¤ã¶ãããé åã¯ããã®é åãããã­ã¹ãã¨ã°ã©ãã£ãã¯ã¹ãå®å¨ã«åé¤ãã¾ãã ãã¡ã¤ã«ãéã ãã®ãã­ã¥ã¡ã³ããããã¤ãã®ãã¥ã¼ã¢ï¼Nitro Reader 5ãªã©ï¼ã§éãã¨ããããã®è¨­å®ãåæ ããã¾ãï¼ ã¾ãã¯ã :title:`Python` ã®ã·ã¼ã±ã³ã¹ã¨ãã¦å®å¨ãªæ°ãããã¼ã¸ã¬ã¤ã¢ã¦ããæºåããå¸æãããã¼ã¸çªå·ãå¸æããé åºã§å«ããå¿è¦ãªãã¼ã¸æ°ã ãç¹°ãè¿ããã¨ãã§ãã¾ããæ¬¡ã®ä¾ã¯ã :meth:`Document.select` ãä½¿ç¨ããå¯è½æ§ãç¤ºãã¦ãã¾ãã PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript æ¬¡ã®ãã¼ã¸ãåç§ãã¦ãã ããï¼ :ref:`ãæç»ã®æ½åºæ¹æ³ã <RecipesDrawingAndGraphics_Extract_Drawings>`ã PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã ãã¼ã¸ãåéç½®ãã **PDF** ããã³ã³ãã³ããå¡ãã¤ã¶ã ãã¼ã­ã³ã°ãããé åã«ç©å½¢ãä½¿ç¨ãã¦ããã¼ã¸ä¸ã®åé¤ãããã¹ãé åãç¤ºãããã«ãèµ¤å­ãä»ããããç¹å¥ãªã¢ããã¼ã·ã§ã³ã§ããé åã«ç©å½¢ããã¼ã¯ããå¾ããã®é åã¯èµ¤å­ã¨ãã¦ãã¼ã¯ãããèµ¤å­ãé©ç¨ãããã¨ããã®ã³ã³ãã³ãã¯å®å¨ã«åé¤ããã¾ãã |PDF| ãåè»¢ããã ããé«åº¦ãªãªãã·ã§ã³ã«ã¤ãã¦ã¯ã:ref:`ãµãã¼ãããã¦ãã <Supported_File_Types>` ã¨ :ref:`ãã¡ã¤ã«ãéãæ¹æ³ã¬ã¤ã<HowToOpenAFile>` ã®ãªã¹ããåç§ãã¦ãã ããã ãã¼ã¸ãé¸æãã :meth:`Document.save` ã¾ãã¯ :meth:`Document.write` ãä½¿ç¨ãã¦ãPDFãã¡ã¤ã«ã®æå·åè©³ç´°ãè¨­å®ããã åæ§ã«ã `doc.delete_pages(from_page=9, to_page=14)` ã¯ããã¼ã¸10ãããã¼ã¸15ã¾ã§ãå«ãç¯å²ã®ãã¼ã¸ãåé¤ãã¾ãã åä¸ã®ãã¼ã¸ãåå²ãã ãã¼ã¸ã§ã³1.16.0ãããPDFã®æå·åã¨å¾©å·åï¼ãã¹ã¯ã¼ããä½¿ç¨ï¼ãå®å¨ã«ãµãã¼ãããã¦ãã¾ããä»¥ä¸ã®ãã¨ãã§ãã¾ãï¼ è¡¨ã¯ã©ã®ãã­ã¥ã¡ã³ãã® :ref:`Page` ãããè¦ã¤ãã¦æ½åºã§ãã¾ãã ãªã¼ãã¼ãã¹ã¯ã¼ãï¼ãã¹ã¯ã¼ããå¤æ´ããããæå·åæ¹æ³ãå¤æ´ããããæ¨©éã®è©³ç´°ãå«ãå®å¨ãªã¢ã¯ã»ã¹æ¨©ãæä¾ãã¾ãã ã¦ã¼ã¶ã¼ãã¹ã¯ã¼ãï¼ææ¸ã®åå®¹ã«ã¢ã¯ã»ã¹ããããã®æ¨©éè©³ç´°ã«åºã¥ãã¦ã¢ã¯ã»ã¹ãæä¾ãã¾ããå­å¨ããå ´åããã¥ã¼ã¢ã§PDFãéãéã«ã¦ã¼ã¶ã¼ãã¹ã¯ã¼ããå¥åããå¿è¦ãããã¾ãã åºæ¬ GUIã¹ã¯ãªãã `join.py <https://github.com/pymupdf/PyMuPDF-Utilities/blob/master/examples/join-documents/join.py>`_ ã§ã¯ããã®æ¹æ³ãä½¿ç¨ãã¦ãã¡ã¤ã«ã®ãªã¹ããçµåããããããã®ç®æ¬¡ã»ã°ã¡ã³ããçµåãã¾ããã¹ã¯ãªããã®è¦ãç®ã¯ä»¥ä¸ã®ããã«ãªã£ã¦ãã¾ã: ãã¼ã¸ã«èµ¤å­ãä½æãã¦é©ç¨ããããã®ããã¤ãã®ãªãã·ã§ã³ãããã¾ãããããã®ãªãã·ã§ã³ãå¶å¾¡ããããã®ãã©ã¡ã¼ã¿ãçè§£ããããã«ã¯ãå®å¨ãªAPIè©³ç´°ã«ã¤ãã¦APIãªãã¡ã¬ã³ã¹ãåç§ãã¦ãã ããã ä¾¿å©ãªé¢æ° :meth:`paper_size` ã¯ã40ä»¥ä¸ã®æ¥­çæ¨æºã®ç¨ç´ãã©ã¼ããããé¸æã§ãã¾ããããããç¢ºèªããã«ã¯ãè¾æ¸ attr:`paperSizes`  ãèª¿ã¹ã¦ãã ãããç¨ç´ã®å¯¸æ³ãåå¾ããããã«ãå¸æããè¾æ¸ã­ã¼ã :meth:`paper_size` ã«æ¸¡ãã¾ããå¤§æå­ã¨å°æå­ã®ä¸¡æ¹ããµãã¼ãããã¦ãã¾ãããã©ã¼ãããåã«ã-Lããè¿½å ããã¨ãæ¨ªé·ãã¼ã¸ã§ã³ãè¿ããã¾ãã æ·»ä»ãã¡ã¤ã«ã®ããã©ã«ãã¢ã¤ã³ã³ã¯ãæ¼ããã³ãã§ããã `icon` ãã©ã¡ã¼ã¿ãè¨­å®ãããã¨ã§ãããå¤æ´ãããã¨ãã§ãã¾ãã æ¬¡ã®ä¾ã¯ããã¹ã¦ã®ãã¼ã¸ã®é åºãéã«ãããã®ã§ãï¼éå¸¸ã«é«é:  :ref:`AdobeManual` ãªãã¡ã¬ã³ã¹ã®756ãã¼ã¸ããµãã»ã«ã³ãã®æéã§å¦çãã¾ãï¼ã ä»¥ä¸ã®ã¹ããããã¯æ°ãã |PDF| ãä½æããå¥ãã®ã¦ã¼ã¶ã¼ãã¹ã¯ã¼ãã¨ãªã¼ãã¼ãã¹ã¯ã¼ãã§æå·åãã¾ããå°å·ãã³ãã¼ãæ³¨éä»ãã®æ¨©éãä¸ãããã¾ãããã¦ã¼ã¶ã¼ãã¹ã¯ã¼ãã§èªè¨¼ããã¦ã¼ã¶ã¼ã«å¯¾ãã¦ã¯å¤æ´ã¯è¨±å¯ããã¾ãã ãã¼ã¸æ°ã¯ `len(doc)`ï¼ `doc.page_count` ã¨åãï¼ã§ä¸ãããã¾ããä»¥ä¸ã®ãªã¹ãã¯ãããããå¶æ°ãã¼ã¸ã¨å¥æ°ãã¼ã¸ã®çªå·ãè¡¨ãã¦ãã¾ãï¼ ãã¼ã¸ã®ã¤ã³ããã¯ã¹ã¯0ããå§ã¾ããããææ¸ã®10ãã¼ã¸ç®ãåé¤ããã«ã¯ãä»¥ä¸ã®ããã«ãã¾ã:  `doc.delete_page(9)`ã ãã­ã¹ããã©ã¡ã¼ã¿ã¼ã¯ãUTF-8ã¨ã³ã³ã¼ãã£ã³ã°ãæ³å®ãã¦ããï¼ã·ã¼ã±ã³ã¹ã®ï¼æå­åã§ããæ¿å¥ã¯ãã¼ã¸ã®ä¸ç«¯ãã1ã¤ã³ãä¸ã§ãããã¤ã³ã :ref:`Point` (50, 72) ããå§ã¾ããå·¦ãã50ãã¤ã³ãã®ä½ç½®ã§ããæ¿å¥ããããã­ã¹ãã®è¡æ°ãè¿ããã¾ãã ç¹å®ã®é åãããã­ã¹ããæ½åºããæ¹æ³ããææ¸ããè¡¨ãæ½åºããæ¹æ³ãªã©ãããã«å¤ãã®ä¾ãããã¾ãããã­ã¹ãã®æ¹æ³ã¬ã¤ããåç§ãã¦ãã ããã ãå¥½ã¿ã®å ´åããã¼ãã«æ½åºã `å¯è½ãªpdf2docxã®extract tablesã¡ã½ãã`_ ãããã¾ãã **PyMuPDF** ãä½¿ç¨ããéã«å¿«é©ã«æããã¹ã *æ°å­¦ç¨èª* ã1ã¤ããã¾ã - **ãåº§æ¨ã** ã§ãããªãã¸ã§ã¯ãã®éç½®ãææ¸ç©ºéã®çè§£ã«å½¹ç«ã¤åº§æ¨ç³»ãçè§£ããããã«ã:ref:`Coordinates` ã»ã¯ã·ã§ã³ãç°¡åã«ãè¦§ãã ããã ããã¯ã2ã¤ã¾ãã¯4ã¤ã®åã®ãã¼ã¸ãçµã¿åãããæ°ãã |PDF| ãä½æãããã¨ãæå³ãã¾ãï¼ã¾ãã¯ã2-upããã4-upããªã©ã¨ãå¼ã°ãã¾ãï¼ãããã¯ãããã¯ã¬ããããµã ãã¤ã«ã®ãããªæ¦è¦ãä½æããããã«ä½¿ç¨ã§ãã¾ãã ãã®æ¹æ³ã¯ã |PDF| ã®ãã¼ã¸ãä»»æã®é¨åã«åå²ãããã¨ã«é¢é£ãã¦ãã¾ããä¾ãã°ãLetterãã©ã¼ãããã®ãã¼ã¸ãå«ã |PDF| ãã4åã®æ¡å¤§çã§å°å·ãããå ´åãèãã¦ã¿ã¾ããããåãã¼ã¸ã¯4ã¤ã®é¨åã«åå²ããããããããåã³Letterãã©ã¼ãããã®åå¥ã® |PDF| ãã¼ã¸ã«ãªãã¾ãã ãã®ãã­ã¥ã¡ã³ãã¯ |version| ã¾ã§ã®ãã¹ã¦ã®ãã¼ã¸ã§ã³ãå¯¾è±¡ã¨ãã¦ãã¾ãã ãã®ã¹ããããã¯ãããããã®ãµããã­ã¥ã¡ã³ããä½æããããããä½¿ç¨ãã¦ãã­ã¥ã¡ã³ããå°å·ãããã¨ãã§ãã¾ãï¼ ãã®ã¹ããããã¯ãPDFãèªèº«ã¨éè¤ããããã¨ã§ããã¼ã¸0ã1ãâ¦ãnã0ã1ãâ¦ãnãå«ãããã«ãã¾ãï¼éå¸¸ã«é«éã§ããã¡ã¤ã«ãµã¤ãºãã»ã¨ãã©å¢ãããã«å®ç¾ãã¾ãï¼ï¼ï¼ ããã«ããããã¼ã¸ä¸ã§è¦ã¤ãã£ããã¹ã¦ã®ãã¯ã¿ã¼å³å½¢ã®ãã¹ã®è¾æ¸ãè¿ããã¾ãã æå·åæ¹æ³ãå¤æ´ããå ´åã¯ãä¸è¨ã®ãã¹ã¦ã®ãªãã·ã§ã³ï¼`encryption`ã`owner_pw`ã`user_pw`ã`permissions`ï¼ãæå®ãã¾ãããã®å ´åãå¢åä¿å­ã¯ã§ãã¾ããã PDFã®æå·åæ¹æ³ãä¿æããã«ã¯ã`encryption=pymupdf.PDF_ENCRYPT_KEEP` ãä½¿ç¨ãã¦ä¿å­ãã¾ããã¾ãã `doc.can_save_incrementally() == True` ã§ããã°ãå¢åä¿å­ãå¯è½ã§ã ç©ºç½ã®ãã¼ã¸ãè¿½å ããã«ã¯ãä»¥ä¸ã®æé ãè¡ãã¾ãï¼ ãã¼ã¸ã«åè»¢ãè¿½å ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ |PDF| ãã¡ã¤ã«ã«ã¦ã©ã¼ã¿ãã¼ã¯ãè¿½å ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ãã: PDFãã¡ã¤ã«ã«ç»åãè¿½å ããããã«ã¯ãä¾ãã°ã­ã´ãè¿½å ããå ´åãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ å¥ã®ãã¡ã¤ã«ããã¼ã¸ã«æ·»ä»ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ãã¼ã¸ãåéç½®ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ãã¼ã¸ãã³ãã¼ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ å®ç¾©ãããç©å½¢ :ref:`Rect<Rect>` ã«ãã¼ã¸ãããªãã³ã°ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ è¤æ°ã®ãã¼ã¸ãææ¸ããåé¤ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ææ¸ãããã¼ã¸ãåé¤ããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ãã¡ã¤ã«ãææ¸ã«åãè¾¼ãã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ |PDF| ãã¹ã¦ã®ç»åãæ½åºããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ |PDF| ãã¡ã¤ã«ãããã¹ã¦ã®ãã­ã¹ããæ½åºããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ãã­ã¥ã¡ã³ãã®ãã¼ã¸ãããã¹ã¦ã®ãã¯ãã«ã°ã©ãã£ãã¯ã¹ãæ½åºããã«ã¯ãä»¥ä¸ã®æé ã«å¾ãã¾ãï¼ |PDF| ãã¡ã¤ã«ãçµåããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ãã¡ã¤ã«ãéãã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ãã¼ã¸ãé¸æããã«ã¯ãä»¥ä¸ã®æé ãå®è¡ãã¦ãã ããï¼ ä»¥ä¸ã®æ¹æ³ãä½¿ç¨ãã¦ãå¥ã®äºåå®ç¾©ãããç¨ç´ãã©ã¼ããããä½¿ã£ã¦ãã¼ã¸ãä½æãã¾ãï¼ :meth:`Document.insert_page` ã¡ã½ãããä½¿ç¨ããã¨ãæ°ãããã¼ã¸ãæ¿å¥ãããåãå¹ã¨é«ãã®ãã©ã¡ã¼ã¿ã¼ãåãå¥ãããã¾ãããããããã®ã¡ã½ããã§ã¯æ°ãããã¼ã¸ã«ä»»æã®ãã­ã¹ããæ¿å¥ãããã¨ãã§ããæ¿å¥ãããè¡æ°ãè¿ããã¾ãã PyMuPDF ãä½¿ç¨ãã pdf2docx_ ã©ã¤ãã©ãªã¨ã**PDF** ãã **DOCX** å½¢å¼ã¸ã®ç°¡åãªãã­ã¥ã¡ã³ãå¤æãæä¾ãã **python-docx** ã©ã¤ãã©ãªããå§ããã¾ãã ããã¯ãã¼ã¯ããã¤ãã¼ãªã³ã¯ã§åç§ããã¦ãããã¼ã¸ãåé¤ããå ´åãã©ããªãã¾ããï¼ :meth:`Page.add_file_annot` ã§ãã¡ã¤ã«ãè¿½å ããéã«ã¯ããã¡ã¤ã«åãæå®ããç¬¬ä¸å¼æ°ã«ã¯å®éã®ãã¡ã¤ã«ã®æ¡å¼µå­ãå«ããå¿è¦ãããã¾ããããããªãã¨ãæ·»ä»ãã¡ã¤ã«ãéãããã®ã¨ãã¦èªè­ãããªãå¯è½æ§ãããã¾ããä¾ãã°ããã¡ã¤ã«åãåã«ãattachmentãã¨ã ãæå®ããã¦ããå ´åãçæãããPDFãè¦ã¦æ·»ä»ãã¡ã¤ã«ãéããã¨ããã¨ã¨ã©ã¼ãçºçããããããã¾ããããããããattachment.pdfãã¨æå®ããã¦ããå ´åãPDFãã¥ã¼ã¢ã¼ã§æå¹ãªãã¡ã¤ã«ã¿ã¤ãã¨ãã¦èªè­ãããéããã¨ãã§ãã¾ãã :meth:`Document.insert_file` ãä½¿ç¨ããã¨ããµãã¼ãããã¦ãããã¡ã¤ã«ãPDFã¨çµåããã¡ã½ãããå¼ã³åºããã¨ãã§ãã¾ããä¾ãã°ï¼ |PyMuPDF| ãä½¿ç¨ããã¨ã |PDF| ã®ãã¼ã¸ãã³ãã¼ãç§»åãåé¤ãã¾ãã¯åéç½®ããããã®ãªãã·ã§ã³ããã¹ã¦æã£ã¦ãã¾ãã :meth:`Document.copy_page` ã¡ã½ããã®ããã«ããã¼ã¸åä½ã§ç´æçãªã¡ã½ãããä½¿ç¨ãã¦ãããã®æä½ãè¡ããã¨ãã§ãã¾ãã åº§æ¨ãæ±ã :ref:`Markdownå½¢å¼ã§ãã­ã¹ããæ½åº <rag_outputting_as_md>` ãããã¨ãã§ãã¾ãã åå®¹ã®å¾©å·åã¾ãã¯æå·å ãã¹ã¯ã¼ãã®è¨­å® æ¨©éã®è©³ç´°è¨­å® æå·åæ¹å¼ã®è¨­å® |PDF| ã®æå·åã¨å¾©å·å 