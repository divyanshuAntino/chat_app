import 'dart:developer';

import 'package:chatapp/feature/chat_detail/widget/chat_details_screen_app_abr.dart';
import 'package:chatapp/feature/chat_detail/widget/receive_message.dart';
import 'package:chatapp/feature/chat_detail/widget/send_message.dart';
import 'package:chatapp/feature/chat_detail/widget/type_area.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:chatapp/responsive/app_screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:chatapp/feature/chat_detail/domain/chat_detail_cubit.dart';

class ChatDetailParms {
  final String receiverId;
  final String? roomId;
  final String userImage;
  final String userName;
  final bool? isOnline;
  final String? lastActive;
  ChatDetailParms({
    required this.receiverId,
    this.roomId,
    required this.userImage,
    required this.userName,
    this.isOnline,
    this.lastActive,
  });
}

class ChatDetails extends StatefulWidget {
  final ChatDetailParms chatDetailParms;
  const ChatDetails({
    super.key,
    required this.chatDetailParms,
  });

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  late IO.Socket _socket;
  List message = [];
  String senderId = '';
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;
  bool isOnline = true;
  @override
  void initState() {
    senderId = context.read<HomeCubit>().state.userProfile?.data?.userid ?? '';
    super.initState();
    connect();
    joinRoom();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  void sendTypingEvent(bool isTyping) {
    if (_isTyping != isTyping) {
      _socket.emit('typing', {
        "room_id": widget.chatDetailParms.roomId ??
            '${senderId}_${widget.chatDetailParms.receiverId}',
        "sender_id": widget.chatDetailParms.receiverId,
      });
    }
  }

  void typingStop() {
    _socket.emit('stop_typing', {
      "room_id": widget.chatDetailParms.roomId ??
          '${senderId}_${widget.chatDetailParms.receiverId}',
      "sender_id": widget.chatDetailParms.receiverId,
    });
  }

  void joinRoom() {
    _socket = IO.io(
      'http://127.0.0.1:5001',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    _socket.off("messages");
    _socket.off("new_message");

    // Join room
    _socket.emit('join room', {
      "room_id": widget.chatDetailParms.roomId ??
          '${senderId}_${widget.chatDetailParms.receiverId}',
      "sender_id": senderId,
      "receiver_id": widget.chatDetailParms.receiverId,
      "userId": context.read<HomeCubit>().state.userProfile?.data?.userid,
    });

    // Set up listeners
    _socket.on("messages", (data) {
      if (mounted) {
        setState(() {
          message = List.from(data);
        });
        WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
      }
    });

    _socket.on("new_message", (data) {
      if (mounted) {
        setState(() {
          message.add(data);
        });
        WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
      }
    });
    _socket.on("user_typing", (data) {
      setState(() {
        log("User is typing: $data");
        if (widget.chatDetailParms.receiverId != data['sender_id']) {
          _isTyping = true;
        }
      });
    });

    _socket.on("user_stop_typing", (data) {
      setState(() {
        log("User stopped typing: $data");
        if (widget.chatDetailParms.receiverId != data['sender_id']) {
          _isTyping = false;
        }
      });
    });
    _socket.on("user-online", (data) {
      setState(() {
        log("User stopped typing: $data");

        isOnline = data['isOnline'];
        print("user -> ${data["userId"]} isOnline $isOnline");
      });
    });
  }

  void sendMessage(String messageText) {
    final roomId = widget.chatDetailParms.roomId ??
        '${senderId}_${widget.chatDetailParms.receiverId}';

    _socket.emit('chat message', {
      "room_id": roomId,
      "sender_id": senderId,
      "message": messageText,
    });
    context.read<ChatDetailCubit>().clearTypingField();
  }

  void getNewMessage() {
    _socket.emit(
      "new message",
      widget.chatDetailParms.roomId ??
          '${senderId}_${widget.chatDetailParms.receiverId}',
    );
    _socket.off("new_message");
    _socket.on("new_message", (data) {
      setState(() {
        message.add(data);
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  void connect() {
    _socket = IO.io(
      'http://127.0.0.1:5001',
      <String, dynamic>{
        'transports': ['websocket'],
      },
    );

    _socket.onConnect((_) {
      log('✅ Connected to socket server');
    });

    _socket.onConnectError((err) {
      log('❌ Connection Error: $err');
    });

    _socket.onError((err) {
      log('🔥 General Error: $err');
    });

    _socket.onDisconnect((_) {
      log('🚫 Disconnected from socket server');
    });

    _socket.onReconnectAttempt((_) {
      log('🔄 Trying to reconnect...');
    });

    _socket.onReconnect((_) {
      log('Reconnected');
    });

    _socket.on('message', (data) {
      log('📩 Message received: $data');
    });
    _socket.connect();
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
  void dispose() {
    super.dispose();
    _socket.disconnect();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          ChatAppBar(
            image: widget.chatDetailParms.userImage,
            name: widget.chatDetailParms.userName,
            isOnline: widget.chatDetailParms.isOnline ?? false,
            lastActive: widget.chatDetailParms.lastActive ?? '',
          ),
          Positioned(
            top: mediaQueryData.size.height * 0.151,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: mediaQueryData.size.height * 0.69,
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
          if (_isTyping)
            Positioned(
              bottom: 50.widthMultiplier,
              child: Lottie.asset('assets/lottie/typings.json',
                  width: 100.widthMultiplier,
                  height: 100.widthMultiplier,
                  repeat: true,
                  reverse: true),
            ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 20.heightMultiplier,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TypeArea(
                onTyping: sendTypingEvent,
                isTyping: _isTyping,
                stopTyping: typingStop,
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
