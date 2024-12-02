import 'package:e_commerce/Features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(context, {required String title}) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, signInView.routeName);
        },
        icon: const Icon(Icons.arrow_back_ios_new)),
    centerTitle: true,
    title: Text(
      title,
      style: textStyle.bold19,
    ),
  );
}
