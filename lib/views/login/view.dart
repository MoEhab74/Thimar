import 'package:flutter/material.dart';
import 'package:thimar/core/ui/login_or_signup_hint.dart';
import 'package:thimar/views/forget_password/forget_password_view.dart';
import 'package:thimar/views/home/view.dart';
import 'package:thimar/views/register/register_view.dart';
import 'package:thimar/core/ui/mobile_number.dart';
import 'package:thimar/core/ui/my_button.dart';
import 'package:thimar/core/ui/my_text_form_field.dart';
import 'package:thimar/core/ui/welcome_message.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 140, height: 140),

              const SizedBox(height: 16),
              WelcomeMessage(
                title: 'مرحبا بك مرة أخرى\n',
                subtitle: 'سجل دخولك للمتابعة',
              ),
              const SizedBox(height: 30),
              // Mobile Number TextField and country
              MobileNumber(),
              const SizedBox(height: 16),
              MyTextFormField(hintText: 'كلمة المرور', obSecureText: true),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => ForgetPasswordView(),
                      ),
                    );
                  },
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff707070),
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              MyButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => HomeView()),
                    (route) => false,
                  );
                },
              ),
              LoginOrSignUpHint(
                hint: 'ليس لديك حساب؟',
                actionText: 'انشاء حساب',
                onPressed: () {
                  // Navigate to RegisterView
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => RegisterView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
