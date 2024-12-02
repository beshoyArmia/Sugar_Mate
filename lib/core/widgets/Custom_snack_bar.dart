import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

void showCoolSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: AppColor.lightPrimaryColor,
    action: SnackBarAction(
      label: '❌',
      textColor: Colors.black,
      onPressed: () {
        // Add your undo action here
      },
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
