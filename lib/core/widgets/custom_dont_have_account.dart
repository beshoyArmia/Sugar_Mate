import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

Row customDontHaveAccount(
    {required String text,
    required String textButton,
    required VoidCallback onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: textStyle.semibold16.copyWith(color: const Color(0xff949D9E)),
      ),
      GestureDetector(
        onTap: onPressed,
        child: Text(
          textButton,
          style: textStyle.semibold16.copyWith(color: AppColor.primaryColor),
        ),
      ),
    ],
  );
}
