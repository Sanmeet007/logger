import 'package:flutter/material.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp(BuildContext context, String phoneNumber) async {
  try {
    final url = "https://wa.me/$phoneNumber";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        AppSnackBar.show(context, content: "Could not launch WhatsApp");
      }
    }
  } catch (_) {
    if (context.mounted) {
      AppSnackBar.show(context, content: "Could not launch WhatsApp");
    }
  }
}
