import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.icon,
    this.onSaved,
    this.observerText = false,
  });
  final bool observerText;
  final String hintText;
  final TextInputType textInputType;
  final Widget? icon;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: observerText,
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return "هذا الحقل مطلوب";
        } else {
          return null;
        }
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        hintStyle: textStyle.bold13.copyWith(color: Color(0xff949D9E)),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        border: customOutLineInputBorder(),
        enabledBorder: customOutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFE6E9E9), width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }
}
