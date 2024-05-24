import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/on_boarding/service/onboarding.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dob extends StatefulWidget {
  const Dob({super.key});

  @override
  State<Dob> createState() => _DobState();
}

class _DobState extends State<Dob> {
  onBoardingServices onboard = onBoardingServices();
  TextEditingController controller = TextEditingController();

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
                keyboardType: TextInputType.datetime,
                controller: controller,
                decoration: const InputDecoration(
                    hintText: "Enter dob", border: InputBorder.none),
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
              onboard.updateUserInfo("dob", controller.text);
              context.pushReplacement("/name");
            },
          )
        ],
      ),
    );
  }
}
