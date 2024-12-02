import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocilaLoginButton extends StatelessWidget {
  const CustomSocilaLoginButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon});
  final VoidCallback? onPressed;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: Color(0xffDDDFDF), width: 1),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                width: 16,
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                text,
                style: textStyle.semibold16.copyWith(color: Colors.black),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          )

          //  ListTile(
          //   visualDensity:
          //       const VisualDensity(vertical: VisualDensity.minimumDensity),
          //   leading: SvgPicture.asset(icon),
          //   title: Text(
          //     text,
          //     style: textStyle.semibold16.copyWith(color: Colors.black),
          //   ),
          // ),
          ),
    );
  }
}
