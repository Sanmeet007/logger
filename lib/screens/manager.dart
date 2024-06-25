import 'package:flutter/material.dart';

class Screen {
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final Widget screen;

  const Screen({
    required this.label,
    required this.icon,
    required this.screen,
    this.selectedIcon,
  });
}

/// Phone screen manager
class ScreenManager extends StatefulWidget {
  final List<Screen> items;
  final int initialIndex;

  const ScreenManager({
    super.key,
    required this.items,
    this.initialIndex = 0,
  });

  @override
  State<ScreenManager> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != widget.initialIndex) {
          setState(() {
            _selectedIndex = widget.initialIndex;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
          bottomNavigationBar: NavigationBar(
              indicatorColor: const Color.fromARGB(217, 223, 202, 255),
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
              destinations: widget.items
                  .map(
                    (item) => NavigationDestination(
                      icon: Icon(item.icon),
                      selectedIcon: Icon(item.selectedIcon),
                      label: item.label,
                    ),
                  )
                  .toList()),
          body:
              widget.items.map((item) => item.screen).toList()[_selectedIndex]),
    );
  }
}
