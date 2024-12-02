import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle.bold16,
          )),
    );
  }
}
