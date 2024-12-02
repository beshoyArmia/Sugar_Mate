import 'package:e_commerce/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigatoinLogic();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // SvgPicture.asset(Assets.imagesLogoSplash),
        Image.asset(
          Assets.imagesLogo,
          height: 500,
          width: 500,
        ),
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(Assets.imagesButtonSplash),
      ],
    );
  }

  void excuteNavigatoinLogic() {
    bool seen = SharedPreferencesSingleton.getBool(isOnBordingViewSeenKEY);
    Future.delayed(const Duration(seconds: 1), () {
      if (seen) {
        //Navigator.pushReplacementNamed(context, LoginView.routeName);
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
