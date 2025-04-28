import 'package:chatapp/app/domain/app_cubit.dart';
import 'package:chatapp/feature/add/domain/add_cubit.dart';
import 'package:chatapp/feature/auth/cubit/auth_cubit.dart';
import 'package:chatapp/feature/chat_detail/domain/chat_detail_cubit.dart';
import 'package:chatapp/feature/home/domain/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootBlocInjection extends StatelessWidget {
  final Widget child;
  const RootBlocInjection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => AddCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => ChatDetailCubit(),
        ),
      ],
      child: child,
    );
  }
}
