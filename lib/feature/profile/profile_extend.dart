import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';

class ProfileExtend extends StatefulWidget {
  const ProfileExtend({Key? key}) : super(key: key);

  @override
  _ProfileExtendState createState() => _ProfileExtendState();
}

class _ProfileExtendState extends State<ProfileExtend> {
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                ],
              )),
          SizedBox(
            height: mediaQueryData.size.height * 0.04,
          ),
          Center(
              child: Stack(children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/image/virat.jpg"),
              radius: 60,
            ),
            Positioned(
              left: mediaQueryData.size.width * 0.21,
              top: mediaQueryData.size.height * 0.093,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: constant.primary),
                  child: const Icon(Icons.photo_camera,
                      color: Colors.white, size: 30)),
            )
          ]))
        ],
      ),
    );
  }
}
