import 'package:flutter/material.dart';
import 'package:thimar/views/active_account_view.dart';
import 'package:thimar/views/create_new_password.dart';
import 'package:thimar/views/login_view.dart';
import 'package:thimar/widgets/login_or_signup_hint.dart';
import 'package:thimar/widgets/my_bincode.dart';
import 'package:thimar/widgets/my_button.dart';
import 'package:thimar/widgets/my_circular_timer.dart';
import 'package:thimar/widgets/resend_code_button.dart';
import 'package:thimar/widgets/welcome_message.dart';

class VerifyOTPView extends StatefulWidget {
  const VerifyOTPView({super.key});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> {
  bool isTimerActive = true;
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
              subtitle: 'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال',
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle change phone number action
                    Navigator.pop(context);
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
                Navigator.push(context, MaterialPageRoute(builder: (builder) => CreateNewPasswordView()));
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
    );
  }
}





