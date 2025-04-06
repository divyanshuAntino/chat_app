import 'package:chatapp/common/widget/upper_card.dart';
import 'package:chatapp/feature/home/widget/person_cart.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UpperCard(),
          GestureDetector(
            onTap: () {
              AppRoutes.appRouter.push(Routes.chatDetail);
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
