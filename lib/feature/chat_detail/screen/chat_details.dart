import 'package:chatapp/feature/chat_detail/widget/chat_details_screen_app_abr.dart';
import 'package:chatapp/feature/chat_detail/widget/receive_message.dart';
import 'package:chatapp/feature/chat_detail/widget/send_message.dart';
import 'package:chatapp/feature/chat_detail/widget/type_area.dart';
import 'package:chatapp/main.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  final String? userId;
  const ChatDetails({super.key, this.userId});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  late String userId;
  late DatabaseReference reference;
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    userId = widget.userId ?? "";
    print(userId);
    reference = FirebaseDatabase.instance
        .ref()
        .child("${auth.currentUser?.uid}$userId");

    // TODO: implement initState
    super.initState();
  }

  void sendMessage(TextEditingController _controller) {
    if (_controller.text.isNotEmpty) {
      reference.push().set({
        'text': _controller.text,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'userId': auth.currentUser?.uid
      }).then((_) {
        print("message Send successfully");
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          const ChatAppBar(),
          Positioned(
              top: mediaQueryData.size.height * 0.151,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: mediaQueryData.size.height * 0.8,
                width: mediaQueryData.size.width,
                child: ListView(
                  children: [SendMessage(), ReceiveMessage()],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: TypeArea(
              onSend: sendMessage,
            ),
          )
        ],
      ),
    );
  }
}
