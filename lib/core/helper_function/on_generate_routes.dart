import 'package:e_commerce/Features/Body/presentation/views/home_view.dart';
import 'package:e_commerce/Features/Body/presentation/views/take_info_view.dart';
import 'package:e_commerce/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:e_commerce/Features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../../Features/auth/presentation/views/signup_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case signInView.routeName:
      return MaterialPageRoute(builder: (context) => const signInView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case TakeInfoView.routeName:
      return MaterialPageRoute(builder: (context) => const TakeInfoView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
