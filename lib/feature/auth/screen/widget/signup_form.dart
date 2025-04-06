import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/common/widget/common_container.dart';
import 'package:chatapp/common/widget/custom_button.dart';
import 'package:chatapp/constant/constant.dart';

import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Form(
      key: _signUpFormKey,
      child: Column(
        children: [
          SizedBox(
            height: mediaQueryData.size.height * 0.05,
          ),
          CustomTextField(
            controller: _nameController,
            hintText: "Name",
          ),
          SizedBox(
            height: mediaQueryData.size.height * 0.03,
          ),
          CustomTextField(
            controller: _emailController,
            hintText: "Email",
          ),
          SizedBox(
            height: mediaQueryData.size.height * 0.03,
          ),
          CustomTextField(
            controller: _passwordController,
            hintText: "PassWord",
          ),
          SizedBox(
            height: mediaQueryData.size.height * 0.07,
          ),
          CustomButton(
              text: "Create Account",
              onTap: () {
                if (_signUpFormKey.currentState!.validate()) {
                  // singUpUser();
                  AppRoutes.appRouter.push("/home");
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
  }
}
