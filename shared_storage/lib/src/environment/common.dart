import 'dart:io';

import '../channels.dart';

/// Util method to call a given `Environment.<any>` method without arguments
Future<Directory?> invokeVoidEnvironmentMethod(String method) async {
  final directory = await kEnvironmentChannel.invokeMethod<String>(method);

  if (directory == null) return null;

  return Directory(directory);
}
