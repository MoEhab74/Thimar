import 'package:flutter/material.dart';

class ResenCodeButton extends StatelessWidget {
  const ResenCodeButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 133,
      child: OutlinedButton(
        onPressed:
            onPressed ??
            () {
              // Handle resend code action
            },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        ),
        child: Text(
          'إعادة الإرسال',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
