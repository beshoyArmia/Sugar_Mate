import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

Row customOrWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Expanded(
        child: const Divider(
          thickness: 2,
          color: Color(0xffDDDFDF),
        ),
      ),
      const SizedBox(
        width: 16,
      ),
      Text(
        "أو",
        style: textStyle.bold16.copyWith(fontSize: 16),
      ),
      const SizedBox(
        width: 16,
      ),
      const Expanded(
        child: Divider(
          thickness: 2,
          color: Color(0xffDDDFDF),
        ),
      ),
    ],
  );
}
