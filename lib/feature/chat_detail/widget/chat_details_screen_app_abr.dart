import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/responsive/app_screen_util.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  final String image;
  final String name;
  final bool isOnline;
  final String lastActive;
  const ChatAppBar({
    super.key,
    required this.image,
    required this.name,
    required this.isOnline,
    required this.lastActive,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 35, left: 10),
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.radiusMultiplier),
            bottomRight: Radius.circular(25.radiusMultiplier),
          ),
          color: constant.primary),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              AppRoutes.appRouter.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: image.contains('http')
                  ? Image.network(image)
                  : Image.asset(
                      "assets/image/ch.jpg",
                      fit: BoxFit.fill,
                      width: 50,
                      height: 50,
                    ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: mediaQueryData.size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  isOnline ? "Online" : lastActive,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: mediaQueryData.size.width * 0.16,
            ),
            child: const Icon(
              Icons.video_camera_front_rounded,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 10.widthMultiplier,
              left: 5.widthMultiplier,
            ),
            child: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
