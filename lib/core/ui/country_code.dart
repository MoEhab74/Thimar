import 'package:flutter/material.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(
          color: Color(0xffF3F3F3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/flag.png',
            width: 32,
            height: 32,
          ),
          // Country Code
          Text(
            '+966',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}


