import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui/stopwatch_hand.dart';
import 'package:stopwatch_flutter/ui/stopwatch_marker.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    Key? key,
    required this.elapsedTime,
    required this.radius,
  }) : super(key: key);
  final Duration elapsedTime;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final double handRotation =
        pi + (2 * pi / 60000) * elapsedTime.inMilliseconds;
    return Stack(
      children: [
        for (int i = 0; i < 60; i++)
          Positioned(
            top: radius,
            left: radius,
            child: StopwatchMarker(
              seconds: i,
              radius: radius,
            ),
          ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: StopwatchTextMarker(
              value: i,
              maxValue: 60,
              radius: radius,
            ),
          ),
        Positioned(
          top: radius,
          left: radius,
          child: StopwatchHand(
            rotationZAngle: handRotation,
            handLength: radius,
            color: Colors.redAccent,
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          top: radius + pi * 13,
          child: ElapsedTimeText(
            elapsed: elapsedTime,
          ),
        ),
      ],
    );
  }
}
