import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.obSecureText,
    this.controller,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final bool? obSecureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      controller: controller,
      obscureText: obSecureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        fillColor: Color(0xFFFFFFFF),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color(0xffB1B1B1),
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xffF3F3F3), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF3F3F3), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
