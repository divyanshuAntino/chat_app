import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/common/widget/common_container.dart';
import 'package:chatapp/common/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _signInFormKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          SizedBox(
            height: mediaQueryData.size.height * 0.07,
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
            text: "login",
            onTap: () {
              if (_signInFormKey.currentState!.validate()) {
                AppRoutes.appRouter.push('/home');
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
  }
}
