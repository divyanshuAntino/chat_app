import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/add/widget/person_add_card.dart';
import 'package:chatapp/feature/on_boarding/service/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  onBoardingServices onBoard = onBoardingServices();
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
          SizedBox(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.8,
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: onBoard.fetchDocuments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: constant.primary,
                  ));
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data found'));
                }

                List<Map<String, dynamic>> documents = snapshot.data!;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> document = documents[index];
                    return PersonAddCart(
                      Name: document['name'],
                      Imagepath: document['image'],
                      tagLine: document['tagLine'],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
