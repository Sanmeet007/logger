import 'package:flutter/material.dart';

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({super.key});

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  List options = [
    {'title': 'Missed', 'isActive': false},
    {'title': 'Rejected', 'isActive': false},
    {'title': 'Incoming', 'isActive': false},
    {'title': 'Outgoing', 'isActive': false},
    {'title': 'Answered Externally', 'isActive': false},
    {'title': 'Blocked', 'isActive': false},
    {'title': 'Wifi Incoming', 'isActive': false},
    {'title': 'Wifi Outgoing', 'isActive': false},
    {'title': 'Voice Mail', 'isActive': false},
    {'title': 'Uknown', 'isActive': false},
  ];

  changeState(item) {
    setState(() {
      item['isActive'] = !item['isActive'];
    });
  }

  customBoxDecoration(isActive) {
    return BoxDecoration(
      color: isActive
          ? const Color.fromARGB(255, 186, 169, 210)
          : const Color.fromARGB(255, 44, 43, 43),
      border: const Border(
          left: BorderSide(color: Colors.black12, width: 1.0),
          bottom: BorderSide(color: Colors.black12, width: 1.0),
          top: BorderSide(color: Colors.black12, width: 1.0),
          right: BorderSide(color: Colors.black12, width: 1.0)),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: options
          .map(
            (option) => Container(
              clipBehavior: Clip.hardEdge,
              decoration: customBoxDecoration(option['isActive']),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    changeState(option);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '${option['title']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: option['isActive']
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : const Color.fromARGB(221, 165, 165, 165),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
    ;
  }
}
