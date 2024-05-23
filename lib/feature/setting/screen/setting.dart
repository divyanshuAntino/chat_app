import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/auth/service/auth.dart';
import 'package:chatapp/feature/setting/widget/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SettinScreen extends StatefulWidget {
  const SettinScreen({super.key});

  @override
  State<SettinScreen> createState() => _SettinScreenState();
}

class _SettinScreenState extends State<SettinScreen> {
  Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(top: 35, left: 10),
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: constant.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Divyanshu",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text("Welcome Back",
                          style: TextStyle(
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, right: 10),
                    child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.3, color: Colors.white),
                          color: Colors.white.withOpacity(0.15),
                        ),
                        child: SvgPicture.asset(
                          "assets/svg/search.svg",
                          color: Colors.white,
                        )),
                  )
                ],
              )),
          const Profile(),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.grey))),
          GestureDetector(
            onTap: () {
              auth.logout();
              context.pushReplacement("/auth");
            },
            child: Container(
                width: mediaQueryData.size.width * 0.95,
                height: mediaQueryData.size.height * 0.08,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.1), width: 1),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Logout")
                  ],
                )),
          )
        ],
      ),
    );
  }
}
