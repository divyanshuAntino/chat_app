import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/home/widget/person_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          GestureDetector(
            onTap: () {
              context.push("/chatDetail");
            },
            child: const PersonCart(
              path: "assets/image/nora.jpg",
              isOnline: true,
              userName: "Nora Singh",
              messageCount: 3,
              lastMessage: "Mje aarhe h zindgi m",
            ),
          ),
          const PersonCart(
            path: "assets/image/sh.jpg",
            isOnline: false,
            userName: "Shradha ",
            lastMessage: "hello",
          ),
          const PersonCart(
            path: "assets/image/virat.jpg",
            isOnline: true,
            userName: "virat",
            messageCount: 1,
            lastMessage: "is bar worldcup humara h ya nhi ",
          ),
          const PersonCart(
            path: "assets/image/ab.jpeg",
            isOnline: true,
            userName: "Abhay'wife",
            lastMessage: "bhambhi ji jaada preshan to na krta h rat m",
          ),
          const PersonCart(
            path: "assets/image/ch.jpg",
            userName: "chinu'wife",
            lastMessage: "hell bhambhi ji",
          ),
        ],
      ),
    );
  }
}
