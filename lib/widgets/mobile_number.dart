import 'package:flutter/material.dart';
import 'package:thimar/widgets/country_code.dart';
import 'package:thimar/widgets/my_text_form_field.dart';


class MobileNumber extends StatelessWidget {
  const MobileNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: MyTextFormField(hintText: 'رقم الجوال')),
        const SizedBox(width: 8),
        CountryCode(),
      ],
    );
  }
}