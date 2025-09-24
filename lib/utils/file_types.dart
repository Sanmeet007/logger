enum FileType { csv, json }

String getFileTypeDetails(FileType t) {
  switch (t) {
    case FileType.csv:
      return "Comma separated values";

    case FileType.json:
      return "Javascript Object notation";
  }
}
