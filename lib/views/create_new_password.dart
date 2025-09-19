import 'package:flutter/material.dart';
import 'package:thimar/views/active_account_view.dart';
import 'package:thimar/views/login_view.dart';
import 'package:thimar/widgets/login_or_signup_hint.dart';
import 'package:thimar/widgets/my_button.dart';
import 'package:thimar/widgets/my_text_form_field.dart';
import 'package:thimar/widgets/welcome_message.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

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
            WelcomeMessage(
              title: 'نسيت كلمة المرور\n',
              subtitle: 'أدخل كلمة المرور الجديدة',
            ),
            const SizedBox(height: 30),
            MyTextFormField(hintText: 'كلمة المرور', obSecureText: true),
            const SizedBox(height: 16),
            MyTextFormField(hintText: 'تأكيد كلمة المرور', obSecureText: true),
            const SizedBox(height: 24),
            MyButton(
              text: 'تغيير كلمة المرور',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => ActiveAccountView()),
              ),
            ),
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
