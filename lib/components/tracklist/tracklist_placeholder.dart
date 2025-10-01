import 'package:flutter/material.dart';

class TrackListPlaceholder extends StatelessWidget {
  final String message;

  const TrackListPlaceholder({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}

class TrackListPlaceholderWidget extends StatelessWidget {
  final Widget child;
  final double height;

  const TrackListPlaceholderWidget({
    super.key,
    required this.child,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
