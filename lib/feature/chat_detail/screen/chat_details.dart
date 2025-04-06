import 'package:chatapp/feature/chat_detail/widget/chat_details_screen_app_abr.dart';
import 'package:chatapp/feature/chat_detail/widget/receive_message.dart';
import 'package:chatapp/feature/chat_detail/widget/send_message.dart';
import 'package:chatapp/feature/chat_detail/widget/type_area.dart';
import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({
    super.key,
  });

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  void initState() {
    super.initState();
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
                children: [
                  SendMessage(),
                  ReceiveMessage(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TypeArea(
              onSend: (TextEditingController _controller) {},
            ),
          )
        ],
      ),
    );
  }
}
