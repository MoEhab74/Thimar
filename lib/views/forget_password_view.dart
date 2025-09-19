import 'package:flutter/material.dart';
import 'package:thimar/views/login_view.dart';
import 'package:thimar/views/verify_otp_view.dart';
import 'package:thimar/widgets/login_or_signup_hint.dart';
import 'package:thimar/widgets/mobile_number.dart';
import 'package:thimar/widgets/my_button.dart';
import 'package:thimar/widgets/welcome_message.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/images/logo.png', width: 140, height: 140),
            const SizedBox(height: 16),
            WelcomeMessage(
              title: 'نسيت كلمة المرور\n',
              subtitle: 'أدخل رقم الجوال المرتبط بحسابك',
            ),
            const SizedBox(height: 30),
            MobileNumber(),
            const SizedBox(height: 16),
            MyButton(text: 'تأكيد رقم الجوال', onPressed: () {
              // Navigate to CreateNewPasswordView
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => VerifyOTPView()),
              );
            }),
            LoginOrSignUpHint(
              hint: 'لديك حساب بالفعل؟',
              actionText: 'تسجيل الدخول',
              onPressed: () {
                // Navigate to LoginView
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => LoginView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
