import 'package:e_commerce/Features/Body/presentation/views/home_view.dart';
import 'package:e_commerce/Features/Body/presentation/views/widgets/take_info_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant.dart';
import '../../../../core/services/shared_preferences_singleton.dart';

class TakeInfoView extends StatefulWidget {
  const TakeInfoView({super.key});
  static const routeName = 'Take info view';

  @override
  State<TakeInfoView> createState() => _TakeInfoViewState();
}

class _TakeInfoViewState extends State<TakeInfoView> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    bool seen =
        SharedPreferencesSingleton.getBoolForTakeInfoPage(isUserGivenInfoKEY);
    if (seen) {
      //Navigator.pushReplacementNamed(context, LoginView.routeName);
      return const HomeView();
    } else {
      return const TakeInfoViewBody();
    }
  }
}
