import 'package:flutter/material.dart';
import 'package:thimar/widgets/login_or_signup_hint.dart';
import 'package:thimar/widgets/mobile_number.dart';
import 'package:thimar/widgets/my_button.dart';
import 'package:thimar/widgets/my_text_form_field.dart';
import 'package:thimar/widgets/welcome_message.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
            Align(
              alignment: Alignment.centerRight,
              child: WelcomeMessage(
                title: 'مرحبا بك مرة أخرى\n',
                subtitle: ' يمكنك تسجيل حساب جديد الان',
              ),
            ),
            const SizedBox(height: 30),
            MyTextFormField(hintText: 'اسم المستخدم'),
            const SizedBox(height: 16),
            MobileNumber(),
            const SizedBox(height: 16),
            MyTextFormField(hintText: 'المدينة'),
            const SizedBox(height: 16),
            MyTextFormField(hintText: 'كلمة المرور', obSecureText: true),
            const SizedBox(height: 16),
            MyTextFormField(hintText: 'تأكيد كلمة المرور', obSecureText: true),
            const SizedBox(height: 28),
            MyButton(text: 'تسجيل'),
            LoginOrSignUpHint(
              hint: 'هل لديك حساب؟',
              actionText: 'تسجيل الدخول',
              onPressed: () {
                // Navigate back to LoginView
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}