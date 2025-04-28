import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        AppRoutes.appRouter.push(Routes.tagLine);
      },
      child: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height * 0.09,
        margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/image/virat.jpg"),
              radius: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: mediaQueryData.size.width * 0.6,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Divyanshu",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Busy",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
