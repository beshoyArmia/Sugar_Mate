import 'package:e_commerce/Features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce/Features/auth/presentation/views/widgets/Login_view_body.dart';

import 'package:e_commerce/core/widgets/Custom_app_bar.dart';
import 'package:e_commerce/core/widgets/Custom_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repos/auth_repo.dart';

class signInView extends StatelessWidget {
  const signInView({super.key});
  static const routeName = 'login page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(GetIt.instance.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: "تسجيل الدخول"),
        body: Builder(builder: (context) {
          return BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInSuccess) {}
              if (state is SignInFailure) {
                showCoolSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return customProgressHud(
                isloading: state is SignInLoading ? true : false,
                child: const LoginViewBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
