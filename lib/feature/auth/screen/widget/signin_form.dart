import 'package:chatapp/feature/auth/cubit/auth_cubit.dart';
import 'package:chatapp/feature/auth/cubit/auth_state.dart';
import 'package:chatapp/common/widget/common_container.dart';
import 'package:chatapp/common/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/constant.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _signInFormKey = GlobalKey<FormState>();

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    AuthCubit authCubit = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: _signInFormKey,
          child: Column(
            children: [
              SizedBox(
                height: mediaQueryData.size.height * 0.07,
              ),
              CustomTextField(
                controller: state.emailController.value,
                hintText: "Email",
              ),
              SizedBox(
                height: mediaQueryData.size.height * 0.03,
              ),
              CustomTextField(
                controller: state.passwordController.value,
                hintText: "PassWord",
              ),
              SizedBox(
                height: mediaQueryData.size.height * 0.07,
              ),
              CustomButton(
                text: "login",
                onTap: () {
                  if (_signInFormKey.currentState!.validate()) {
                    authCubit.loginUser();
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: constant.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: constant.primary),
                      ),
                      child: Image.asset("assets/image/google.png",
                          width: 40, height: 40)),
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: constant.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: constant.primary),
                      ),
                      child: Image.asset("assets/image/facebook.png",
                          width: 40, height: 40)),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: constant.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: constant.primary),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/image/twi.png",
                          width: 40, height: 40),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
