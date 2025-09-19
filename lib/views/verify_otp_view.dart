import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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
            PinCodeTextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textStyle: TextStyle(
                fontSize: 24,
                color: Color(0xFFFFFFFF),
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,
              ),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              enableActiveFill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(16),
                fieldHeight: 60,
                fieldWidth: 70,
                activeFillColor: Theme.of(context).colorScheme.primary,
                selectedFillColor: Theme.of(context).colorScheme.primary,
                inactiveFillColor: Color(0xFFFFFFFF),
                selectedColor: Theme.of(context).colorScheme.primary,
                activeColor: Color(0xffF3F3F3),
                inactiveColor: Color(0xffF3F3F3),
                borderWidth: 1,
              ),
              onChanged: (value) {
                print("Current code: $value");
              },
              onCompleted: (value) {
                print("Code entered: $value");
                // هنا تقدر تعمل Verify للـ OTP
              },
            ),
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
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: 133,
              child: OutlinedButton(
                onPressed: () {
                  // Handle resend OTP action
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                ),
                child: Text(
                  'إعادة الإرسال',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
