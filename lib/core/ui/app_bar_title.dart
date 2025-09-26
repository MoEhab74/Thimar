import 'package:flutter/material.dart';
class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: 'التوصيل إلى',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
            ),
          ),
          TextSpan(
            text: '\nشارع الملك فهد - جدة',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Tajawal',
            ),
          ),
        ],
      ),
    );
  }
}