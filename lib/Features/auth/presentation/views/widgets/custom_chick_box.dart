import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CuastomCheckBox extends StatelessWidget {
  const CuastomCheckBox({required this.ischecked, required this.onchecked});
  final bool ischecked;
  final ValueChanged<bool>? onchecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onchecked!(!ischecked);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        height: 24,
        width: 24,
        decoration: ShapeDecoration(
          color: ischecked ? AppColor.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.5, color: Color(0xffDDDFDF)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
            child: SvgPicture.asset(
          Assets.imagesImageCheck,
        )),
      ),
    );
  }
}
