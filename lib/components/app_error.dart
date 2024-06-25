import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final IconData displayIcon;
  final String errorMessage;

  const AppError(
      {super.key, required this.displayIcon, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ah snap! Something went wrong",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
