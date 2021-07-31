import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_in_flutter/widgets/styling_button.dart';

class TimerButtons extends StatelessWidget {
  final Timer? timer;
  final Duration duration;
  final bool isRunning;
  final bool isCompleted;
  final void Function({bool resets}) onStop;
  final void Function() onStart;
  final void Function() onCancel;

  TimerButtons(
    this.duration,
    this.timer, {
    required this.onStart,
    required this.onStop,
    required this.onCancel,
  })  : isRunning = timer == null ? false : timer.isActive,
        isCompleted = duration.inSeconds == 0;

  @override
  Widget build(BuildContext context) => isRunning || isCompleted
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StylingButton(
                text: 'PAUSE', onClicked: () => onStop(resets: false)),
            SizedBox(
              width: 12,
            ),
            StylingButton(
                text: "CANCEL", onClicked: () => onStop(resets: true)),
          ],
        )
      : StylingButton(
          text: "Start Timer!",
          color: Colors.black,
          backgroundColor: Colors.white,
          onClicked: onStart,
        );
}
