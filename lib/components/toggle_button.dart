import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isSelected = false;

  void updateState() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? OutlinedButton(onPressed: () {}, child: Text("hi"))
        : ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(isSelected ? Colors.red : Colors.blue),
            ),
            child: Text(isSelected ? "Selected" : "Not Selected"));
  }
}
