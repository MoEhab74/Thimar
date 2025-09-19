import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MyBinCodeTextField extends StatelessWidget {
  const MyBinCodeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
    );
  }
}