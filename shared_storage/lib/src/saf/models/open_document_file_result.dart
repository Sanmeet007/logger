/// The result of [openDocumentFileWithResult].
///
/// Use this enum to implement custom handles to all possible results of [openDocumentFileWithResult].
///
/// e.g:
///
/// ```dart
/// final result = documentFile.openDocumentFileWithResult(); // or openDocumentFileWithResult(documentFile)
/// switch (result) {
///   case OpenDocumentFileResult.launched:
///     // ....
///     break;
///   case OpenDocumentFileResult.failedDueActivityNotFound:
///     // No configured application for [documentFile.type]
///     break;
///   default:
///     // Unknown error
///     break;
/// }
/// ```
enum OpenDocumentFileResult {
  /// Successfully launched the target URI in a external application.
  launched,

  /// Could not launch URI because the device has no application that can handle the current URI/file type.
  failedDueActivityNotFound,

  /// Could not launch URI probably because:
  ///
  /// - The application is running in a restricted environment such as Kid Mode in Android.
  /// - Your application has no permission over the target URI.
  failedDueSecurityPolicy,

  /// Could not launch URI probably due some IO exception, it's recommended to try again in this case.
  failedDueUnknownReason;

  const OpenDocumentFileResult();

  bool get success => this == OpenDocumentFileResult.launched;
}
