import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

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
              child: const TextField(
                decoration: InputDecoration(
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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
