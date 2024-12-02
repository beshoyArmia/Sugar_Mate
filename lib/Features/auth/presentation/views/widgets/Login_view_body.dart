import 'package:e_commerce/Features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce/Features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce/Features/auth/presentation/views/widgets/Custom_socila_Login_button.dart';

import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_textStyle.dart';
import 'package:e_commerce/core/widgets/Custom_Text_form_field.dart';
import 'package:e_commerce/core/widgets/Custom_or_divider.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_dont_have_account.dart';
import 'package:e_commerce/core/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (p0) {
                  email = p0!;
                },
                textInputType: TextInputType.emailAddress,
                hintText: "البريد الالكتروني",
              ),
              const SizedBox(
                height: 16,
              ),
              passwordField(
                onSaved: (p0) {
                  password = p0!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: textStyle.semibold13
                        .copyWith(color: AppColor.lightPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                  text: "تسجيل الدخول",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SignInCubit>().signInWithEmailAndPassword(
                          email: email, password: password);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }),
              const SizedBox(
                height: 33,
              ),
              customDontHaveAccount(
                text: "لا تمتلك حساب؟",
                textButton: " قم بإنشاء حساب",
                onPressed: () {
                  Navigator.pushNamed(context, SignupView.routeName);
                },
              ),
              const SizedBox(
                height: 33,
              ),
              customOrWidget(),
              const SizedBox(
                height: 16,
              ),
              CustomSocilaLoginButton(
                  onPressed: () {
                    context.read<SignInCubit>().signInWithGoogle();
                  },
                  text: "تسجيل بواسطة جوجل",
                  icon: Assets.imagesGoogleIcon),
              const SizedBox(
                height: 16,
              ),
              CustomSocilaLoginButton(
                  onPressed: () {},
                  text: "تسجيل بواسطة أبل",
                  icon: Assets.imagesAppleIcon),
              const SizedBox(
                height: 16,
              ),
              CustomSocilaLoginButton(
                  onPressed: () {},
                  text: "تسجيل بواسطة فيسبوك",
                  icon: Assets.imagesFacebookIcon),
            ],
          ),
        ),
      ),
    );
  }
}
