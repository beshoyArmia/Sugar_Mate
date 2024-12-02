import 'package:e_commerce/Features/auth/presentation/cubits/signUp_cubit/sign_up_cubit.dart';

import 'package:e_commerce/Features/auth/presentation/views/widgets/custom_terms_widget.dart';
import 'package:e_commerce/core/widgets/Custom_snack_bar.dart';

import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/widgets/Custom_Text_form_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool isTermsAccepted = false;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                    name = p0!;
                  },
                  textInputType: TextInputType.name,
                  hintText: "الاسم كامل",
                ),
                const SizedBox(
                  height: 16,
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
                  height: 32,
                ),
                CustomTermsWidget(
                  onpressed: (value) {
                    isTermsAccepted = value;
                  },
                ),
                const SizedBox(
                  height: 33,
                ),
                CustomButton(
                    text: "إنشاء حساب جديد",
                    onPressed: () {
                      if (isTermsAccepted) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context
                              .read<SignUpCubit>()
                              .createUserWithEmailAndPassword(
                                  email: email, password: password, name: name);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      } else {
                        showCoolSnackBar(
                            context, "يرجى الموافقة على الشروط والاحكام");
                      }
                    }),
                const SizedBox(
                  height: 33,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
