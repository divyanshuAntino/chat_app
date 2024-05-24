import 'package:chatapp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class onBoardingServices {
  void createUser() async {
    await FirebaseFirestore.instance
        .collection('user_data')
        .doc(auth.currentUser?.uid)
        .set({
      "dob": "",
      "email": auth.currentUser?.email ?? "",
      "password": "",
      "image": "",
      "name": "",
      "phoneNumber": auth.currentUser?.phoneNumber ?? "",
      "userName": "",
    }).then((value) {
      print("email added successfully");
    });
  }

  void updateUserInfo(String fieldName, String FieldValue) async {
    await FirebaseFirestore.instance
        .collection("user_data")
        .doc(auth.currentUser?.uid)
        .update({fieldName: FieldValue}).then((value) {
      print(fieldName + " updated successfully");
    });
  }
}
