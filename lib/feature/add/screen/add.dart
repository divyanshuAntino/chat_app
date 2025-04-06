import 'package:chatapp/common/widget/upper_card.dart';

import 'package:chatapp/feature/add/widget/person_add_card.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UpperCard(),
          SizedBox(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.8,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return PersonAddCart(
                    name: "Divyanshu Singh",
                    imagepath: "assets/image/virat.jpg",
                    tagLine: "sfafds",
                    userId: "sdfasdf");
              },
            ),
          )
        ],
      ),
    );
  }
}
