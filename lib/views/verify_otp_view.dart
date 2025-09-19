import 'package:flutter/material.dart';
import 'package:thimar/widgets/my_button.dart';
import 'package:thimar/widgets/welcome_message.dart';

class VerifyOTPView extends StatelessWidget {
  const VerifyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png', width: 140, height: 140),
            const SizedBox(height: 16),
            WelcomeMessage(title: 'نسيت كلمة المرور', subtitle: 'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال'),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: '9660548745+',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff707070),
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: ' تغيير رقم الجوال',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                  ),
                  // Add gesture recognizer if needed for tap action
                ),
              ])
            ),
            const SizedBox(height: 30),
            // Add your OTP input fields here
            const SizedBox(height: 24),
            MyButton(text: 'تأكيد الكود', onPressed: () {
              // Handle OTP verification
            }),
          ],
        ),
      ),
    );
  }
}