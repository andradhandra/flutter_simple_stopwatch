import 'package:flutter/material.dart';

class StopwatchHand extends StatelessWidget {
  const StopwatchHand({
    Key? key,
    required this.rotationZAngle,
    required this.handLength,
    this.handThicknes = 2,
    this.color = Colors.white,
  }) : super(key: key);

  final double rotationZAngle;
  final double handThicknes;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: handLength,
      width: handThicknes,
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThicknes / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
