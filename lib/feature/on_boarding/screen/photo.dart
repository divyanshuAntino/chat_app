import 'dart:io';

import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  File? selectedImage;
  bool selectimage = false;

  Future openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        selectimage = true;
      });
    } else {}
  }

  Future selectPhotoFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        selectimage = true;
      });
    } else {}
  }

  // ignore: non_constant_identifier_names
  ShowBottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (constext) {
          return Container(
            height: 150,
            decoration: BoxDecoration(
                color: constant.primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      openCamera();
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      selectPhotoFromGallery();
                    },
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            ShowBottomSheet();
          },
          child: Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: selectimage
                      ? AssetImage("assets/image/person.png")
                      : AssetImage(
                          selectedImage?.path ?? "assets/image/person.png"),
                ),
              ),
              Positioned(
                  top: mediaQueryData.size.height * 0.085,
                  left: mediaQueryData.size.width * 0.57,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: constant.primary),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                      Size(mediaQueryData.size.width * 0.3, 50)),
                  backgroundColor: WidgetStateProperty.all(constant.primary)),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                AppRoutes.appRouter.push(Routes.home);
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                      Size(mediaQueryData.size.width * 0.3, 50)),
                  backgroundColor: WidgetStateProperty.all(constant.primary)),
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                AppRoutes.appRouter.push(Routes.home);
              },
            ),
          ],
        )
      ],
    ));
  }
}
