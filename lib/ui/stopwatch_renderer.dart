import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    Key? key,
    required this.elapsedTime,
  }) : super(key: key);
  final Duration elapsedTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent,
              width: 3,
            ),
            shape: BoxShape.circle,
          ),
        ),
        ElapsedTimeText(
          elapsed: elapsedTime,
        ),
      ],
    );
  }
}
