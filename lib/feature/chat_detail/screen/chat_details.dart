import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/chat_detail/widget/type_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
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
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.video_camera_front_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.video_camera_front_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          const Align(
            alignment: Alignment.bottomCenter,
            child: TypeArea(),
          )
        ],
      ),
    );
    ;
  }
}
