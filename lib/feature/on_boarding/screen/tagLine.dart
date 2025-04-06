import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';

class TagLine extends StatelessWidget {
  const TagLine({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                    hintText: "Enter tagline", border: InputBorder.none),
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
              AppRoutes.appRouter.push(Routes.name);
            },
          )
        ],
      ),
    );
  }
}
