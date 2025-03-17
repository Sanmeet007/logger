import 'package:appcheck/appcheck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final whatsappAvailabilityProvider = FutureProvider<bool>((ref) async {
  final appCheck = AppCheck();
  try {
    final isAvailable = await appCheck.checkAvailability("com.whatsapp");
    if (isAvailable != null) return true;
    return false;
  } catch (e) {
    return false;
  }
});
