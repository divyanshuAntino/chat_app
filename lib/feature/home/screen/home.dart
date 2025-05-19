import 'dart:developer';

import 'package:chatapp/common/widget/upper_card.dart';
import 'package:chatapp/feature/auth/cubit/auth_cubit.dart';
import 'package:chatapp/feature/chat_detail/screen/chat_details.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:chatapp/feature/home/domain/home_state.dart';
import 'package:chatapp/feature/home/screen/widget/person_cart.dart';
import 'package:chatapp/responsive/app_screen_util.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit homeCubit;
  late IO.Socket _socket;
  List message = [];
  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
    homeCubit.getUserProfile();
    connect();
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

      gerRooms();
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

  void gerRooms() {
    final senderId = getUserId();
    _socket.emit('get room', senderId);
    _socket.on("room_list", (data) {
      setState(() {
        message = data;
      });
    });
  }

  String getUserId() {
    final userId = context.read<AuthCubit>().state.userId;
    return userId;
  }

  @override
  dispose() {
    _socket.disconnect();
    final senderId = getUserId();
    _socket.emit('user-offline', {'userId': senderId});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UpperCard(
                name: state.userProfile?.data?.name ?? '',
              ),
              8.toVerticalSizedBox,
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      AppRoutes.appRouter.push(
                        Routes.chatDetail,
                        extra: ChatDetailParms(
                          lastActive: message[index]['lastSeen'],
                          isOnline: message[index]['isOnline'],
                          userName: message[index]['userInfo']['userName'],
                          userImage: message[index]['userInfo']['userImage'],
                          receiverId:
                              message[index]['userInfo']['userId'] ?? '',
                          roomId: message[index]['roomID'],
                        ),
                      );
                    },
                    child: PersonCart(
                      path: message[index]['userInfo']['userImage'],
                      isOnline: message[index]['isOnline'],
                      userName: message[index]['userInfo']['userName'],
                      lastMessageTime: message[index]['lastMessage'] == null
                          ? ""
                          : message[index]['lastMessage']['created_at'],
                      lastMessage: message[index]['lastMessage'] != null
                          ? message[index]['lastMessage']['message']
                          : 'Start conversation with ${message[index]['userInfo']['userName']}',
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
