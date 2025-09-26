import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'سلة ثمار',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            fontFamily: 'Tajawal',
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 8.0),
          child: SizedBox(
            height: 32,
            width: 32,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ],
    );
  }
}