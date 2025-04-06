import 'package:chatapp/feature/auth/screen/auth.dart';
import 'package:chatapp/feature/chat_detail/screen/chat_details.dart';
import 'package:chatapp/feature/on_boarding/screen/dob.dart';
import 'package:chatapp/feature/on_boarding/screen/name.dart';
import 'package:chatapp/feature/on_boarding/screen/photo.dart';
import 'package:chatapp/feature/on_boarding/screen/tagLine.dart';
import 'package:chatapp/feature/on_boarding/screen/user_name.dart';
import 'package:chatapp/navbar/navbar.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final GoRouter routes = GoRouter(
      initialLocation: Routes.home,
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => const NavBar(),
        ),
        GoRoute(
          path: Routes.auth,
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          path: Routes.userName,
          builder: (context, state) => const UserName(),
        ),
        GoRoute(
          path: Routes.profile,
          builder: (context, state) => const ProfilePhoto(),
        ),
        GoRoute(
          path: Routes.chatDetail,
          builder: (context, state) {
            return ChatDetails();
          },
        ),
        GoRoute(
          path: Routes.dob,
          builder: (context, state) => const Dob(),
        ),
        GoRoute(
          path: Routes.name,
          builder: (context, state) => const Name(),
        ),
        GoRoute(
          path: Routes.tagLine,
          builder: (context, state) => const TagLine(),
        ),
      ]);

  static GoRouter get appRouter => routes;
}
