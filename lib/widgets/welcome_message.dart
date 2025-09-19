import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text.rich(
        textAlign: TextAlign.right,
        TextSpan(
          style: TextStyle(height: 2),
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextSpan(
              text: subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'Tajawal',
                color: Color(0xff707070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
