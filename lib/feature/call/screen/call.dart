import 'package:chatapp/common/widget/upper_card.dart';
import 'package:chatapp/feature/call/widget/call_receive.dart';
import 'package:chatapp/feature/call/widget/misscall.dart';
import 'package:chatapp/feature/call/widget/outging_call.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    final name = context.read<HomeCubit>().state.userProfile?.data?.name ?? '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UpperCard(
            name: name,
          ),
          const CallReceive(),
          const OutGoingCall(),
          const MissedCall()
        ],
      ),
    );
  }
}
