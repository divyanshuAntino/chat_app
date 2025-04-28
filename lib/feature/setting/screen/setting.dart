import 'package:chatapp/common/widget/upper_card.dart';

import 'package:chatapp/feature/auth/cubit/auth_cubit.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:chatapp/feature/setting/widget/profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettinScreen extends StatefulWidget {
  const SettinScreen({super.key});

  @override
  State<SettinScreen> createState() => _SettinScreenState();
}

class _SettinScreenState extends State<SettinScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final name = context.read<HomeCubit>().state.userProfile?.data?.name ?? '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UpperCard(
            name: name,
          ),
          const Profile(),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.grey))),
          GestureDetector(
            onTap: () {
              // auth.logout();

              context.read<AuthCubit>().logout();
            },
            child: Container(
              width: mediaQueryData.size.width * 0.95,
              height: mediaQueryData.size.height * 0.08,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.black.withOpacity(0.1), width: 1),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Logout")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
