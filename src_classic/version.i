%pythoncode %{
VersionFitz = "1.23.9" # MuPDF version.
VersionBind = "1.23.12" # PyMuPDF version.
VersionDate = "2024-01-12 00:00:01"
version = (VersionBind, VersionFitz, "20240112000001")
pymupdf_version_tuple = tuple( [int(i) for i in VersionFitz.split('.')])
%}
