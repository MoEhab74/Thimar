import 'package:flutter/material.dart';
import 'package:thimar/core/ui/country_code.dart';
import 'package:thimar/core/ui/my_text_form_field.dart';

class MobileNumber extends StatelessWidget {
  const MobileNumber({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyTextFormField(
            hintText: 'رقم الجوال',
            keyboardType: TextInputType.phone,
            controller: controller,
          ),
        ),
        const SizedBox(width: 8),
        CountryCode(),
      ],
    );
  }
}
