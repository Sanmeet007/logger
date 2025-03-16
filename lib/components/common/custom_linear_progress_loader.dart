import 'package:flutter/material.dart';

class CustomLinearProgressLoader extends StatelessWidget {
  const CustomLinearProgressLoader({
    super.key,
    required this.linearLoaderText,
  });

  final String linearLoaderText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(202, 0, 0, 0)
            : const Color.fromARGB(202, 255, 255, 255),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                linearLoaderText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width / 2,
                // height: 20,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? const Color.fromARGB(255, 96, 82, 118)
                            : const Color.fromARGB(255, 214, 189, 255),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(255, 203, 169, 255)
                        : const Color.fromARGB(255, 106, 26, 227),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
