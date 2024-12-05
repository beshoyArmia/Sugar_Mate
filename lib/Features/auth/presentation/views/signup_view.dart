import 'package:e_commerce/Features/auth/presentation/cubits/signUp_cubit/sign_up_cubit.dart';
import 'package:e_commerce/Features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/Features/auth/presentation/views/widgets/signup_view_body.dart';

import 'package:e_commerce/core/widgets/Custom_app_bar.dart';
import 'package:e_commerce/core/widgets/Custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../domain/repos/auth_repo.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signupview';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(GetIt.instance.get<AuthRepo>()),
      // create: (context) => SignUpCubit(
      //     AuthReposEmpl(firebaseAuthService: FirebaseAuthService())),
      child: Scaffold(
        appBar: customAppBar(context, title: "حساب جديد"),
        body: Builder(builder: (context) {
          return BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                Navigator.pushReplacementNamed(context, signInView.routeName);
              }
              if (state is SignUpfailure) {
                showCoolSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SignUpLoading ? true : false,
                child: const SignupViewBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
