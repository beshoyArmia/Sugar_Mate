import 'package:e_commerce/core/widgets/Custom_Text_form_field.dart';
import 'package:flutter/material.dart';

class passwordField extends StatefulWidget {
  passwordField({
    required this.onSaved,
    super.key,
  });
  void Function(String?)? onSaved;

  @override
  State<passwordField> createState() => _passwordFieldState();
}

class _passwordFieldState extends State<passwordField> {
  bool observerText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      observerText: observerText,
      onSaved: widget.onSaved,
      textInputType: TextInputType.visiblePassword,
      hintText: "كلمة المرور",
      icon: IconButton(
          onPressed: () {
            setState(() {
              observerText = !observerText;
            });
          },
          icon: observerText
              ? const Icon(Icons.visibility_off)
              : const Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                )),
    );
  }
}
