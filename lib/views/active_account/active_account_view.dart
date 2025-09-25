import 'package:flutter/material.dart';
import 'package:thimar/core/ui/login_or_signup_hint.dart';
import 'package:thimar/views/forget_password/forget_password_view.dart';
import 'package:thimar/views/login/view.dart';
import 'package:thimar/core/ui/my_bincode.dart';
import 'package:thimar/core/ui/my_button.dart';
import 'package:thimar/core/ui/my_circular_timer.dart';
import 'package:thimar/core/ui/resend_code_button.dart';
import 'package:thimar/core/ui/welcome_message.dart';

class ActiveAccountView extends StatefulWidget {
  const ActiveAccountView({super.key});

  @override
  State<ActiveAccountView> createState() => _ActiveAccountView();
}

class _ActiveAccountView extends State<ActiveAccountView> {
  bool isTimerActive = true;
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
                title: 'تفعيل الحساب\n',
                subtitle: 'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال',
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle change phone number action
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => ForgetPasswordView()));
                    },
                    child: Text(
                      'تغيير رقم الجوال',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '9660548745+',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff707070),
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Add your OTP input fields here
              MyBinCodeTextField(),
              const SizedBox(height: 24),
              MyButton(
                text: 'تأكيد الكود',
                onPressed: () {
                  // Handle OTP verification
                },
              ),
              const SizedBox(height: 24),
              Text(
                'لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff707070),
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 16),
              // Circular countdown timer
              if (isTimerActive)
                MyCircularDowenTimer(
                  onComplete: () {
                    setState(() {
                      isTimerActive = false;
                    });
                  },
                ),
              const SizedBox(height: 20),
              if (!isTimerActive)
                ResenCodeButton(
                  onPressed: () {
                    // Handle resend OTP action
                    setState(() {
                      isTimerActive = true;
                    });
                  },
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
      ),
    );
  }
}





