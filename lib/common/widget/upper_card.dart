import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpperCard extends StatelessWidget {
  final String name;
  const UpperCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 45, left: 10),
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          color: constant.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello $name",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
