import 'package:e_commerce/Features/on_boarding/presentation/views/widgets/Page_view_item.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;
  const OnBoardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
            isvisible: true,
            image: Assets.imagesPageViewItemImage1,
            packGroundImage: Assets.imagesPageViewItemBackground1,
            subTitle:
                'تطبيقك الشخصي لإدارة السكري بسهولة وفعالية. نحن هنا لمساعدتك في متابعة مستويات السكر، وتحسين عاداتك اليومية، والوصول إلى حياة صحية متوازنة.',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "مرحبا بك في",
                  style: textStyle.bold23,
                ),
                const SizedBox(
                  width: 9,
                ),
                Text(
                  "Mate",
                  style:
                      textStyle.bold23.copyWith(color: AppColor.secondryColor),
                ),
                Text(
                  "Sugar",
                  style:
                      textStyle.bold23.copyWith(color: AppColor.primaryColor),
                ),
              ],
            )),
        const PageViewItem(
            isvisible: false,
            image: Assets.imagesPageViewItemImage2,
            packGroundImage: Assets.imagesPageViewItemBackground2,
            subTitle:
                'متابعة مستويات السكر في الدم يوميًا، والحصول على توصيات شخصية للغذاء والتمارين، وتتبع تقدمك وتحسين عاداتك الصحية، ودعمك لتكوين أسلوب حياة صحي ومستدام.',
            title: Text(
              "ابدأ رحلتك الصحية",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w700,
                  height: 0),
            )),
      ],
    );
  }
}
