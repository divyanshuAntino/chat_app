import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/on_boarding/service/onboarding.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  onBoardingServices onboard = onBoardingServices();
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    onboard.createUser();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.black)),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    hintText: "Enter UserName", border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(
                    Size(mediaQueryData.size.width * 0.6, 50)),
                backgroundColor: WidgetStateProperty.all(constant.primary)),
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              onboard.updateUserInfo("userName", controller.text);
              context.pushReplacement("/dob");
            },
          )
        ],
      ),
    );
  }
}
