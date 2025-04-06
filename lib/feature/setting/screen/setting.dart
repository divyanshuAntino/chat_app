import 'package:chatapp/common/widget/upper_card.dart';
import 'package:chatapp/feature/auth/service/auth.dart';
import 'package:chatapp/feature/setting/widget/profile.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';

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
          UpperCard(),
          const Profile(),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.grey))),
          GestureDetector(
            onTap: () {
              auth.logout();
              AppRoutes.appRouter.push(Routes.auth);
            },
            child: Container(
              width: mediaQueryData.size.width * 0.95,
              height: mediaQueryData.size.height * 0.08,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.black.withOpacity(0.1), width: 1),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
