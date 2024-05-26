import 'package:chatapp/common/service/sharePreference.dart';
import 'package:chatapp/common/widget/common_container.dart';
import 'package:chatapp/common/widget/custom_button.dart';
import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/auth/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  Authentication auth = Authentication();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void singUpUser() async {
    final userCredential = await auth.SignUpWithGoogle();
    if (userCredential != null) {
      pref.saveData("logIn", "loggedIn");
      bool isLoggedIn = await auth.checkUserId(userCredential.user?.uid ?? "");
      if (isLoggedIn) {
        context.push("/home");
      } else {
        context.push("/userName");
        auth.addUserToUserIds(userCredential.user?.uid ?? "");
      }
    } else {
      print("Somethinf went wrong");
    }
  }

  // void singInUser() {
  //   authService.signInUser(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //     context: context,
  //   );
  // }

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
                        if (_auth == Auth.signup)
                          Form(
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
                                        if (_signUpFormKey.currentState!
                                            .validate()) {
                                          // singUpUser();
                                        }
                                      }),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print("Tapped");
                                            singUpUser();
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: constant.primary
                                                    .withOpacity(0.1),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: constant.primary),
                                              ),
                                              child: Image.asset(
                                                  "assets/image/google.png",
                                                  width: 40,
                                                  height: 40)),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: constant.primary
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: constant.primary),
                                            ),
                                            child: Image.asset(
                                                "assets/image/facebook.png",
                                                width: 40,
                                                height: 40)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: constant.primary
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: constant.primary),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                  "assets/image/twi.png",
                                                  width: 40,
                                                  height: 40),
                                            )),
                                      ])
                                ],
                              )),
                        if (_auth == Auth.signin)
                          Form(
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
                                        if (_signInFormKey.currentState!
                                            .validate()) {
                                          // singInUser();
                                        }
                                      }),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: constant.primary
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: constant.primary),
                                            ),
                                            child: Image.asset(
                                                "assets/image/google.png",
                                                width: 40,
                                                height: 40)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: constant.primary
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: constant.primary),
                                            ),
                                            child: Image.asset(
                                                "assets/image/facebook.png",
                                                width: 40,
                                                height: 40)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: constant.primary
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: constant.primary),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                  "assets/image/twi.png",
                                                  width: 40,
                                                  height: 40),
                                            )),
                                      ])
                                ],
                              )),
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
