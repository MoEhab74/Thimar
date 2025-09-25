import 'package:flutter/material.dart';

class LoginOrSignUpHint extends StatelessWidget {
  const LoginOrSignUpHint({
    super.key,
    required this.hint,
    required this.actionText,
    this.onPressed,
  });
  final String hint;
  final String actionText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPressed ?? () {},
            child: Text(
              actionText,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            hint,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff707070),
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
