import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class MyCircularDowenTimer extends StatelessWidget {
  const MyCircularDowenTimer({
    super.key, this.onComplete,
  });

  final void Function()? onComplete;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.primary,
        fontFamily: 'Tajawal',
        fontWeight: FontWeight.w400,
      ),
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      width: 67,
      height: 70,
      duration: 5,
      fillColor: Theme.of(context).colorScheme.primary,
      ringColor: Color(0xffF3F3F3),
      onComplete: onComplete,
    );
  }
}