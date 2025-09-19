import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key, required this.text, this.onPressed,
  });

  final String text ;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFFFFFFF),
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

