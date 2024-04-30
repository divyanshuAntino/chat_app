import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';

class MyStatus extends StatefulWidget {
  const MyStatus({super.key});

  @override
  State<MyStatus> createState() => _MyStatusState();
}

class _MyStatusState extends State<MyStatus> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height * 0.1,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage("assets/image/virat.jpg"),
              ),
              Positioned(
                  top: mediaQueryData.size.height * 0.043,
                  left: mediaQueryData.size.width * 0.11,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: constant.primary),
                    child: const Icon(Icons.add, color: Colors.white),
                  ))
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: mediaQueryData.size.width * 0.55,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Divyanshu ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  "Tap to add the status",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                  maxLines: 1,
                )
              ],
            ),
          ),
        ]));
  }
}
