import 'package:e_commerce/Features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'on_boarding_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
