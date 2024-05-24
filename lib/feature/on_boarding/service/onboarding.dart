import 'dart:io';

import 'package:chatapp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      "tagLine": ""
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

  void uploadImage(File imageFile) async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    try {
      final ref = _storage
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.png');
      await ref.putFile(imageFile);
      final downloadURL = await ref.getDownloadURL();
      updateUserInfo("image", downloadURL);
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<List<Map<String, dynamic>>> _fetchDocuments() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('your_collection').get();
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      List<Map<String, dynamic>> data =
          documents.map((doc) => doc.data() as Map<String, dynamic>).toList();
      return data;
    } catch (e) {
      print('Error fetching documents: $e');
      return [];
    }
  }
}
