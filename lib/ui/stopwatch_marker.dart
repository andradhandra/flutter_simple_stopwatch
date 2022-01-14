import 'package:flutter/material.dart';

class StopwatchMarker extends StatelessWidget {
  const StopwatchMarker({
    Key? key,
    required this.seconds,
    required this.radius,
  }) : super(key: key);
  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
    );
  }
}
