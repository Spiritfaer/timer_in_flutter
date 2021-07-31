import 'package:flutter/material.dart';
import 'package:timer_in_flutter/widgets/timer_card.dart';

class TimerView extends StatelessWidget {
  final Duration duration;

  final String _hours;
  final String _minutes;
  final String _seconds;

  TimerView(this.duration)
      : _hours = _twoDigits(duration.inHours),
        _minutes = _twoDigits(duration.inMinutes.remainder(60)),
        _seconds = _twoDigits(duration.inSeconds.remainder(60));

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TimerCard(_hours, 'HOURS'),
        SizedBox(
          width: 8,
        ),
        TimerCard(_minutes, 'MINUTES'),
        SizedBox(
          width: 8,
        ),
        TimerCard(_seconds, 'SECONDS'),
      ]);

  static String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
