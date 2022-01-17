import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _currentElapsedTime = Duration.zero;
  Duration _previousElapsedTime = Duration.zero;
  late final Ticker _ticker;
  bool _isRunning = false;

  Duration get _elapsed => _previousElapsedTime + _currentElapsedTime;

  void _startStopTime() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previousElapsedTime += _currentElapsedTime;
        _currentElapsedTime = Duration.zero;
      }
    });
  }

  void _resetTime() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _currentElapsedTime = Duration.zero;
      _previousElapsedTime = Duration.zero;
    });
  }

  @override
  void initState() {
    super.initState();
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _currentElapsedTime = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2;
      return Stack(
        children: [
          StopwatchRenderer(
            elapsedTime: _elapsed,
            radius: radius,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 80,
              width: 80,
              child: StartStopButton(
                isRunning: _isRunning,
                onPressed: _startStopTime,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: _resetTime,
              ),
            ),
          )
        ],
      );
    });
  }
}
