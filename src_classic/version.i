%pythoncode %{
VersionFitz = "1.23.9" # MuPDF version.
VersionBind = "1.23.15" # PyMuPDF version.
VersionDate = "2024-01-16 00:00:01"
version = (VersionBind, VersionFitz, "20240116000001")
pymupdf_version_tuple = tuple( [int(i) for i in VersionFitz.split('.')])
%}
