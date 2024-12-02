import 'package:e_commerce/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:e_commerce/core/helper_function/on_generate_routes.dart';
import 'package:e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_commerce/core/services/get_it_service.dart';

import 'core/services/custom_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  await SharedPreferencesSingleton.init();
  runApp(const Fruit_hub());
}

class Fruit_hub extends StatelessWidget {
  const Fruit_hub({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Cairo",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale("ar"),
      onGenerateRoute: onGenerateRoute,
      home: const SplashView(),
    );
  }
}
        // This is the theme of your application.
