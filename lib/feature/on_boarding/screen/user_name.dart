import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextField(
          decoration: InputDecoration(
              hintText: "Enter User Name", border: InputBorder.none),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(constant.primary)),
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
