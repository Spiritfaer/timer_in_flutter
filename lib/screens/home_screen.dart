import 'dart:async';

import 'package:flutter/material.dart';

import 'package:timer_in_flutter/widgets/timer_buttons.dart';
import 'package:timer_in_flutter/widgets/timer_view.dart';

class MyHomePage extends StatefulWidget {
  final String title = 'Simple timer';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  bool countDown = true;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerView(duration),
            SizedBox(
              height: 80,
            ),
            TimerButtons(
              duration,
              timer,
              onStart: startTimer,
              onStop: stopTimer,
              onCancel: stopTimer,
            )
          ],
        ),
      );
}
