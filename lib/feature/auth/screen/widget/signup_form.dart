import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/auth/cubit/auth_cubit.dart';
import 'package:chatapp/feature/auth/cubit/auth_state.dart';
import 'package:chatapp/common/widget/common_container.dart';
import 'package:chatapp/common/widget/custom_button.dart';
import 'package:chatapp/constant/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: _signUpFormKey,
          child: Column(
            children: [
              SizedBox(
                height: mediaQueryData.size.height * 0.05,
              ),
              CustomTextField(
                controller: state.nameController.value,
                hintText: "Name",
              ),
              SizedBox(
                height: mediaQueryData.size.height * 0.03,
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
                hintText: "Password",
              ),
              SizedBox(
                height: mediaQueryData.size.height * 0.07,
              ),
              CustomButton(
                  isLoading: state.apiStatus.isLoading,
                  text: "Create Account",
                  onTap: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      // singUpUser();
                      authCubit.createUser();
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: constant.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: constant.primary),
                      ),
                      child: Image.asset(
                        "assets/image/google.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: constant.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: constant.primary),
                    ),
                    child: Image.asset(
                      "assets/image/facebook.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: constant.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: constant.primary),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/image/twi.png",
                        width: 40,
                        height: 40,
                      ),
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
