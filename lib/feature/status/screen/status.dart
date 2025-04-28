import 'package:chatapp/common/widget/upper_card.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:chatapp/feature/status/widget/add_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
          MyStatus(),
        ],
      ),
    );
  }
}
