enum FileType { csv, json, ical }

String getFileTypeDetails(FileType t) {
  switch (t) {
    case FileType.csv:
      return "Comma separated values";

    case FileType.json:
      return "Javascript object notation";

    case FileType.ical:
      return "Internet calendar format";
  }
}
