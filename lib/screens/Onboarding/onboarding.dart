import 'package:flutter/material.dart';
import 'package:logger/app_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingUI extends StatelessWidget {
  final SharedPreferences? prefs;

  const OnboardingUI({
    super.key,
    required this.prefs,
  });

  void finishOnboarding(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BaseApplication(
          prefs: prefs,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              finishOnboarding(context);
            },
            child: Text("Done"))
      ],
    );
  }
}
