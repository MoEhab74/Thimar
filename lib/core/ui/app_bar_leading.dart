import 'package:flutter/material.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 0, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xff4C8613).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.notifications_active_outlined,
          color: Color(0xff4C8613),
        ),
        onPressed: () {
        },
      ),
    );
  }
}