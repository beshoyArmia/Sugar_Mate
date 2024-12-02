import 'package:e_commerce/Features/auth/presentation/views/widgets/custom_chick_box.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class CustomTermsWidget extends StatefulWidget {
  const CustomTermsWidget({
    super.key,
    required this.onpressed,
  });
  final ValueChanged onpressed;
  @override
  State<CustomTermsWidget> createState() => _CustomTermsWidgetState();
}

class _CustomTermsWidgetState extends State<CustomTermsWidget> {
  bool isTermsChecked = false;
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CuastomCheckBox(
              onchecked: (value) {
                isTermsChecked = value;
                widget.onpressed(value);
                setState(() {});
              },
              ischecked: isTermsChecked,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "من خلال إنشاء حساب ، فإنك توافق على  ",
                      style: textStyle.semibold13
                          .copyWith(color: Color(0xff949D9E)),
                    ),
                    TextSpan(
                      text: "الشروط والاحكام",
                      style: textStyle.semibold13
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        );
      },
    );
  }
}
