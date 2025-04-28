import 'package:chatapp/feature/chat_detail/widget/chat_details_screen_app_abr.dart';
import 'package:chatapp/feature/chat_detail/widget/receive_message.dart';
import 'package:chatapp/feature/chat_detail/widget/send_message.dart';
import 'package:chatapp/feature/chat_detail/widget/type_area.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:chatapp/responsive/app_screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:chatapp/feature/chat_detail/domain/chat_detail_cubit.dart';

class ChatDetails extends StatefulWidget {
  final String receiverId;
  const ChatDetails({
    super.key,
    required this.receiverId,
  });

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  late IO.Socket _socket;
  List message = [];
  String senderId = '';
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    senderId = context.read<HomeCubit>().state.userProfile?.data?.userid ?? '';
    super.initState();
    // connect();
    joinRoom();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  void joinRoom() {
    _socket = IO.io(
      'http://127.0.0.1:5001', // e.g., http://localhost:3000 or your IP
      <String, dynamic>{
        'transports': ['websocket'],
      },
    );

    print(widget.receiverId);
    _socket.emit('join room', {
      "room_id": '${senderId}_${widget.receiverId}',
      "sender_id": senderId,
      "receiver_id": widget.receiverId,
    });
    _socket.on("messages", (data) {
      print(data.toString());
      setState(() {
        message = data;
      });
    });
  }

  void sendMessage(String message) {
    _socket.emit('chat message', {
      "room_id": '${senderId}_${widget.receiverId}',
      "sender_id": senderId,
      "message": message,
    });
    context.read<ChatDetailCubit>().clearTypingField();
    getNewMessage();
  }

  void getNewMessage() {
    _socket.emit("new message", '${senderId}_${widget.receiverId}');
    _socket.off("new_message");
    _socket.on("new_message", (data) {
      setState(() {
        message.add(data);
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  @override
  void didUpdateWidget(covariant ChatDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: mediaQueryData.size.height * 0.73,
              width: mediaQueryData.size.width,
              child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: message.length,
                  itemBuilder: (context, index) {
                    if (senderId == message[index]["sender_id"]) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 10.widthMultiplier,
                        ),
                        child: SendMessage(
                          createdAt: message[index]["created_at"],
                          message: message[index]["message"],
                        ),
                      );
                    }
                    return ReceiveMessage(
                      createdAt: message[index]["created_at"],
                      message: message[index]["message"],
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 20.heightMultiplier,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TypeArea(
                onSend: (message) {
                  sendMessage(message);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
