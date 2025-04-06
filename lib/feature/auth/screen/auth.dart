import 'package:chatapp/common/service/sharePreference.dart';

import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/auth/screen/widget/signin_form.dart';
import 'package:chatapp/feature/auth/screen/widget/signup_form.dart';

import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  customSharePreference pref = customSharePreference();
  Auth _auth = Auth.signup;
  Color colorSign = Colors.black;
  Color colorSignup = constant.primary;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: constant.primary,
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: mediaQueryData.size.height * 0.08),
                  child: SizedBox(
                      width: mediaQueryData.size.width * 0.65,
                      height: mediaQueryData.size.height * 0.2,
                      child: Image.asset(
                        "assets/image/auth.png",
                      )),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  child: Container(
                    color: Colors.white,
                    height: mediaQueryData.size.height * 0.683,
                    width: mediaQueryData.size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaQueryData.size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _auth = Auth.signup;
                                  colorSignup = constant.primary;
                                  colorSign = Colors.black;
                                });
                              },
                              child: Text(
                                "Register",
                                style:
                                    TextStyle(color: colorSignup, fontSize: 24),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _auth = Auth.signin;
                                  colorSign = constant.primary;
                                  colorSignup = Colors.black;
                                });
                              },
                              child: Text(
                                "Login",
                                style:
                                    TextStyle(color: colorSign, fontSize: 24),
                              ),
                            )
                          ],
                        ),
                        if (_auth == Auth.signup) SignupForm(),
                        if (_auth == Auth.signin) SigninForm()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
