Þ    *      l              ¼     ½     Ë     Ø     ï  þ     s     ]   x     Ö     h  :   p  G   «     ó  %  z  3      %   Ô     ú       õ    u   
  
   ú
               ¨  M   °  |   þ    {  7        Ç  C   Ú  ¶     S   Õ  é   )  X     P   l  e   ½  ø   #       H   8          ¡     ½    Ý     z               ®  b  Â     %  ~   »  È   :       c          ¬       ¹  X   J  L   £  Þ   ð     Ï  ·  æ  v           ¤   &   -   Ë   
   ù   r   !     w!  ¬  "  h   »#     $$  f   A$    ¨$  T   Å%  :  &     U'  u   Ö'  °   L(  ²  ý(  3   °*  d   ä*  *   I+  /   t+  *   ¤+   **Class API** **Example:** **Method / Attribute** **Short Description** A **file** will be read with mode `"rb"` and these binary data (a `bytes` object) be treated as a single-member sub-archive. In this case, the `path` parameter is **mandatory** and should be the member name under which this item can be found / retrieved. A **folder** will be converted to a sub-archive, so its files (and any sub-folders) can be accessed by their names. A list of the archive's sub-archives. Each list item is a dictionary with the following keys: Append a sub-archive. The meaning of the parameters are exactly the same as explained above. Of course, parameter `content` is not optional here. Archive Checks whether an entry exists in any of the sub-archives. Creates a new archive. Without parameters, an empty archive is created. If `content` is either binary data or a file name, this parameter is mandatory and must be the name under which the data can be found. If duplicate entry names exist in the archive, always the last entry with that name will be found / retrieved. During archive creation, or appending more data to an archive (see :meth:`Archive.add`) no check for duplicates will be made. Use the `path` parameter to prevent this from happening. If provided, `content` may be one of the following: If provided, `path` must be a string. In PyMuPDF, archives are currently only used by :ref:`Story` objects to specify where to look for fonts, images and other resources. New in v1.21.0 Otherwise this parameter is optional. It can be used to simulate a folder name or a mount point, under which this sub-archive's elements can be found. For example this specification `Archive((data, "name"), "path")` means that `data` will be found using the element name `"path/name"`. Similar is true for other sub-archives: to retrieve members of a ZIP sub-archive, their names must be prefixed with `"path/"`. The main purpose of this parameter probably is to differentiate between duplicate names. PDF Text Extraction, PDF Image Extraction, PDF Conversion, PDF Tables, PDF Splitting, PDF Creation, Pyodide, PyScript Parameters PyMuPDF is a high-performance Python library for data extraction, analysis, conversion & manipulation of PDF (and other) documents. Retrieve the data of an entry. Returns The binary data (`bytes`) of the entry. If not found, an exception is raised. The fully qualified name of the entry. So must include any `path` prefix under which the entry's sub-archive has been added. This class represents a generalization of file folders and container files like ZIP and TAR archives. Archives allow accessing arbitrary collections of file folders, ZIP / TAR files and single binary data elements as if they all were part of one hierarchical tree of folders. This documentation covers all versions up to |version|. `True` or `False`. `entries` -- a list of (top-level) entry names in this sub-archive. `fmt` -- the format of the sub-archive. This is one of the strings "dir" (file folder), "zip" (ZIP archive), "tar" (TAR archive), or "tree" for single binary entries or file content. `path` -- the value of the `path` parameter under which this sub-archive was added. a Python binary object (`bytes`, `bytearray`, `io.BytesIO`): this will add a single-member sub-archive. In this case, the `path` parameter is **mandatory** and should be the member name under which this item can be found / retrieved. a Python sequence: This is a convenience format to specify any combination of the above. a `zipfile.ZipFile` or `tarfile.TarFile` object: Will be added as a sub-archive. a string: this must be the name of a local folder or file. `pathlib.Path` objects are also supported. a tuple `(data, name)`: This will add a single-member sub-archive with the member name `name`. `data` may be a Python binary object or a local file name (in which case its binary file content is used). Use this format if you need to specify `path`. add new data to the archive another Archive: the archive is being made a sub-archive of the new one. check if given name is a member list[dict] of archive items read the data given by the name Project-Id-Version: PyMuPDF 1.23.0rc1
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
 ã¯ã©ã¹ API **ä¾ï¼**  **ã¡ã½ãã / å±æ§** **ç°¡åãªèª¬æ** **ãã¡ã¤ã«** ã¯ã¢ã¼ã `"rb"` ã§èª­ã¿åããããããã®ãã¤ããªãã¼ã¿ï¼ `bytes` ãªãã¸ã§ã¯ãï¼ã¯åä¸ã®ã¡ã³ãã¼ãµãã¢ã¼ã«ã¤ãã¨ãã¦æ±ããã¾ãããã®å ´åã`path` ãã©ã¡ã¼ã¿ã¼ã¯ **å¿é ** ã§ããã®ã¢ã¤ãã ãè¦ã¤ãã/åå¾ã§ããã¡ã³ãã¼åã§ããå¿è¦ãããã¾ãã **ãã©ã«ã** ã¯ãµãã¢ã¼ã«ã¤ãã«å¤æããããã®ãã¡ã¤ã«ï¼ããã³ãµããã©ã«ãï¼ã¯ååã§ã¢ã¯ã»ã¹ã§ãã¾ãã ã¢ã¼ã«ã¤ãã®ãµãã¢ã¼ã«ã¤ãã®ãªã¹ãã§ããåãªã¹ãã¢ã¤ãã ã¯ãæ¬¡ã®ã­ã¼ãæã¤è¾æ¸ã§ãï¼ ãµãã¢ã¼ã«ã¤ããè¿½å ãã¾ãããã©ã¡ã¼ã¿ã®æå³ã¯ä¸è¨ã¨ã¾ã£ããåãã§ãããã¡ãããããã§ã¯ãã©ã¡ã¼ã¿ `content` ã¯ãªãã·ã§ã³ã§ã¯ããã¾ããã Archive (ã¢ã¼ã«ã¤ã) ã¨ã³ããªããµãã¢ã¼ã«ã¤ãã®ããããã«å­å¨ãããã©ãããç¢ºèªãã¾ãã æ°ããã¢ã¼ã«ã¤ããä½æãã¾ãããã©ã¡ã¼ã¿ã¼ãæå®ãããªãå ´åãç©ºã®ã¢ã¼ã«ã¤ããä½æããã¾ãã `content` ããã¤ããªãã¼ã¿ã¾ãã¯ãã¡ã¤ã«åã®å ´åããã®ãã©ã¡ã¼ã¿ã¼ã¯å¿é ã§ããã¼ã¿ãè¦ã¤ããååã§ããå¿è¦ãããã¾ãã ã¢ã¼ã«ã¤ãåã«éè¤ããã¨ã³ããªåãå­å¨ããå ´åãå¸¸ã«ãã®ååã®æå¾ã®ã¨ã³ããªãè¦ã¤ãã/åå¾ããã¾ããã¢ã¼ã«ã¤ãã®ä½æä¸­ãã¾ãã¯ã¢ã¼ã«ã¤ãã«ããã«ãã¼ã¿ãè¿½å ããé :meth:`Archive.add` ãåç§ï¼ãéè¤ããã§ãã¯ãã¾ããããã®åé¡ãé²ãããã« path ãã©ã¡ã¼ã¿ã¼ãä½¿ç¨ãã¦ãã ããã æä¾ãããå ´åã`content` ã¯æ¬¡ã®ããããã§ãããã¨ãã§ãã¾ãï¼ æä¾ãããå ´åã`path` ã¯æå­åã§ããå¿è¦ãããã¾ãã PyMuPDFã§ã¯ãã¢ã¼ã«ã¤ãã¯ç¾å¨ããã©ã³ããç»åãããã³ãã®ä»ã®ãªã½ã¼ã¹ãæ¤ç´¢ããå ´æãæå®ããããã« :ref:`Story` ãªãã¸ã§ã¯ãã«ãã£ã¦ã®ã¿ä½¿ç¨ããã¦ãã¾ãã v1.21.0ã§ã®æ°æ©è½ ããä»¥å¤ã®å ´åããã®ãã©ã¡ã¼ã¿ã¼ã¯ãªãã·ã§ã³ã§ããããã¯ããã®ãµãã¢ã¼ã«ã¤ãã®è¦ç´ ãè¦ã¤ãããã¦ã³ããã¤ã³ãã¾ãã¯ãã©ã«ãåãã·ãã¥ã¬ã¼ãããããã«ä½¿ç¨ã§ãã¾ãããã¨ãã°ããã®ä»æ§ `Archive((data, "name"), "path")` ã¯ããã¼ã¿ãè¦ç´ å "`"path/name"` ã§è¦ã¤ããã¾ããä»ã®ãµãã¢ã¼ã«ã¤ãã«ã¤ãã¦ãåæ§ã§ãï¼ZIPãµãã¢ã¼ã«ã¤ãã®ã¡ã³ãã¼ãåå¾ããã«ã¯ããã®ååã« `"path/"` ãæ¥é ­è¾ã¨ãã¦è¿½å ããå¿è¦ãããã¾ãããã®ãã©ã¡ã¼ã¿ã¼ã®ä¸»ãªç®çã¯ãéè¤ããååãåºå¥ãããã¨ã§ããå¯è½æ§ãããã¾ãã PDFãã­ã¹ãæ½åºãPDFã¤ã¡ã¼ã¸æ½åºãPDFå¤æãPDFãã¼ãã«ãPDFåå²ãPDFä½æ, Pyodide, PyScript ãã©ã¡ã¼ã¿: PyMuPDF ã¯ãPDF ï¼ããã³ãã®ä»ã®ï¼ãã­ã¥ã¡ã³ãã®ãã¼ã¿æ½åºãåæãå¤æãæä½ã®ããã®é«æ§è½ãª Python ã©ã¤ãã©ãªã§ãã ã¨ã³ããªã®ãã¼ã¿ãåå¾ãã¾ãã æ»ãå¤: ã¨ã³ããªã®ãã¤ããªãã¼ã¿ï¼ `bytes` ï¼ã§ããè¦ã¤ãããªãå ´åã¯ä¾å¤ãçºçãã¾ãã ã¨ã³ããªã®å®å¨ä¿®é£¾åãã¨ã³ããªã®ãµãã¢ã¼ã«ã¤ããè¿½å ããããã¹ã®ãã¬ãã£ãã¯ã¹ãå«ãå¿è¦ãããã¾ãã ãã®ã¯ã©ã¹ã¯ããã¡ã¤ã«ãã©ã«ãã¼ãZIPãTARã¢ã¼ã«ã¤ãã®ãããªã³ã³ãããã¡ã¤ã«ã®ä¸è¬åãè¡¨ãã¾ããã¢ã¼ã«ã¤ãã¯ããã¡ã¤ã«ãã©ã«ãã¼ãZIP/TARãã¡ã¤ã«ãããã³åä¸ã®ãã¤ããªãã¼ã¿è¦ç´ ã®ä»»æã®ã³ã¬ã¯ã·ã§ã³ã«ã¢ã¯ã»ã¹ã§ããããã«ãããã¹ã¦ã1ã¤ã®éå±¤çãªãã©ã«ãã¼ããªã¼ã®ä¸é¨ã§ãããã®ããã«ãã¾ãã ãã®ãã­ã¥ã¡ã³ãã¯ |version| ã¾ã§ã®ãã¹ã¦ã®ãã¼ã¸ã§ã³ãå¯¾è±¡ã¨ãã¦ãã¾ãã `True` ã¾ãã¯ `False` ã `entries` - ãã®ãµãã¢ã¼ã«ã¤ãåã®ï¼ãããã¬ãã«ã®ï¼ã¨ã³ããªåã®ãªã¹ãã `fmt` - ãµãã¢ã¼ã«ã¤ãã®å½¢å¼ãããã¯æå­å "dir"ï¼ãã¡ã¤ã«ãã©ã«ãï¼ã"zip"ï¼ZIPã¢ã¼ã«ã¤ãï¼ã"tar"ï¼TARã¢ã¼ã«ã¤ãï¼ãã¾ãã¯åä¸ã®ãã¤ããªã¨ã³ããªã¾ãã¯ãã¡ã¤ã«ã³ã³ãã³ãã®å ´åã¯ "tree" ã®ããããã§ãã `path` - ãã®ãµãã¢ã¼ã«ã¤ããè¿½å ããããã©ã¡ã¼ã¿ã®å¤ã§ãã Python ãã¤ããªãªãã¸ã§ã¯ãï¼ `bytes`ã`bytearray` ã`io.BytesIO` ï¼: ããã¯åä¸ã®ã¡ã³ãã¼ãµãã¢ã¼ã«ã¤ããè¿½å ãã¾ãããã®å ´åã`path` ãã©ã¡ã¼ã¿ã¼ã¯ **å¿é ** ã§ããã®ã¢ã¤ãã ãè¦ã¤ãã/åå¾ã§ããã¡ã³ãã¼åã§ããå¿è¦ãããã¾ãã Pythonã·ã¼ã±ã³ã¹: ããã¯ä¸è¨ã®ããããã®çµã¿åãããæå®ããããã®ä¾¿çãã©ã¼ãããã§ãã `zipfile.ZipFile` ã¾ãã¯ `tarfile.TarFile` ãªãã¸ã§ã¯ã: ãµãã¢ã¼ã«ã¤ãã¨ãã¦è¿½å ããã¾ãã æå­å: ããã¯ã­ã¼ã«ã«ãã©ã«ãã¾ãã¯ãã¡ã¤ã«ã®ååã§ããå¿è¦ãããã¾ãã`pathlib.Path` ãªãã¸ã§ã¯ãããµãã¼ãããã¦ãã¾ãã ã¿ãã«`(data, name)`: ããã¯ã¡ã³ãã¼å `name` ãæã¤åä¸ã®ã¡ã³ãã¼ãµãã¢ã¼ã«ã¤ããè¿½å ãã¾ãã`data` ã¯Pythonãã¤ããªãªãã¸ã§ã¯ãã¾ãã¯ã­ã¼ã«ã«ãã¡ã¤ã«åã§ããå¯è½æ§ãããã¾ãï¼ãã®å ´åããã¤ããªãã¡ã¤ã«ã®ã³ã³ãã³ããä½¿ç¨ããã¾ãï¼ã`path` ãæå®ããå¿è¦ãããå ´åã¯ããã®ãã©ã¼ããããä½¿ç¨ãã¦ãã ããã ã¢ã¼ã«ã¤ãã«æ°ãããã¼ã¿ãè¿½å ãã å¥ã® Archive: ã¢ã¼ã«ã¤ãã¯æ°ããã¢ã¼ã«ã¤ãã®ãµãã¢ã¼ã«ã¤ãã«ãªãã¾ãã ååã§æå®ããããã¼ã¿ãèª­ã ã¢ã¼ã«ã¤ãã¢ã¤ãã ã®ãªã¹ã[è¾æ¸] ååã§æå®ããããã¼ã¿ãèª­ã 