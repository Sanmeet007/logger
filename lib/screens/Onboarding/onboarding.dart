import 'package:flutter/material.dart';
import 'package:logger/app_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingUI extends StatefulWidget {
  final SharedPreferences? prefs;

  const OnboardingUI({
    super.key,
    required this.prefs,
  });

  @override
  State<OnboardingUI> createState() => _OnboardingUIState();
}

class _OnboardingUIState extends State<OnboardingUI> {
  final _controller = PageController(viewportFraction: 1, keepPage: true);
  int currentIndex = 0;

  void finishOnboarding(context) async {
    await widget.prefs?.setBool("show-onboarding", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BaseApplication(
          prefs: widget.prefs,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pages = <OnBoardingScreenItem>[
      OnBoardingScreenItem(
        imageName: "1.png",
        title: "Manage Call Logs",
        subtitle:
            "Search, filter, and manage your call logs with a seamless and intuitive interface.",
      ),
      OnBoardingScreenItem(
        imageName: "2.png",
        title: "Analyze Your Calls",
        subtitle:
            "Understand your call patterns like never before and get detailed insights to optimize your time.",
      ),
      OnBoardingScreenItem(
        imageName: "3.png",
        title: "Import & Export",
        subtitle:
            "Seamlessly transfer call logs between devices or export them for safekeeping and analysis.",
      ),
    ];

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                padEnds: false,
                controller: _controller,
                itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                dotColor: Color.fromARGB(255, 220, 211, 238),
                activeDotColor: Color.fromARGB(255, 175, 138, 255),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex != 2) {
                      currentIndex += 1;
                      _controller.animateToPage(
                        currentIndex,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInSine,
                      );
                    } else {
                      finishOnboarding(context);
                    }
                  },
                  child: Text(
                    currentIndex == 2 ? "Explore now" : "Next",
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                OutlinedButton(
                  onPressed: currentIndex != 2
                      ? () {
                          finishOnboarding(context);
                        }
                      : null,
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OnBoardingScreenItem extends StatelessWidget {
  final String imageName, subtitle, title;

  const OnBoardingScreenItem({
    super.key,
    required this.imageName,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final dirName =
        Theme.of(context).brightness == Brightness.dark ? "dark" : "light";

    return Column(
      children: [
        const SizedBox(
          height: 50.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 250,
          child: Image.asset("assets/images/on_boarding/$dirName/$imageName"),
        ),
        const SizedBox(
          height: 100.0,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
