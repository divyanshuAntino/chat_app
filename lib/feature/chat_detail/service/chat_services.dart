import 'package:chatapp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  String currentUserId = auth.currentUser?.uid ?? "";

  Future<String> chreatChatRoom(String fieldValue) async {
    await FirebaseFirestore.instance
        .collection("user_data")
        .doc(auth.currentUser?.uid)
        .update({
      "chatIds": FieldValue.arrayUnion([currentUserId + fieldValue])
    }).then((value) {
      print("chat id created successfully");
    });
    await FirebaseFirestore.instance
        .collection("user_data")
        .doc(fieldValue)
        .update({
      "chatIds": FieldValue.arrayUnion([currentUserId + fieldValue]),
    }).then((value) {
      print(" chat id created successfully");
    });
    return fieldValue + currentUserId;
  }
}
