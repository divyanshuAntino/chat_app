import 'package:chatapp/feature/auth/screen/auth.dart';
import 'package:chatapp/feature/chat_detail/screen/chat_details.dart';
import 'package:chatapp/feature/on_boarding/screen/dob.dart';
import 'package:chatapp/feature/on_boarding/screen/name.dart';
import 'package:chatapp/feature/on_boarding/screen/photo.dart';
import 'package:chatapp/feature/on_boarding/screen/tagLine.dart';
import 'package:chatapp/feature/on_boarding/screen/user_name.dart';
import 'package:chatapp/navbar/navbar.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final GoRouter routes = GoRouter(initialLocation: "/auth", routes: [
    GoRoute(path: "/home", builder: (context, state) => const NavBar()),
    GoRoute(path: "/auth", builder: (context, state) => const AuthScreen()),
    GoRoute(path: "/userName", builder: (context, state) => const UserName()),
    GoRoute(
        path: "/profile", builder: (context, state) => const ProfilePhoto()),
    GoRoute(
        path: "/chatDetail", builder: (context, state) => const ChatDetails()),
    GoRoute(path: "/dob", builder: (context, state) => const Dob()),
    GoRoute(path: "/name", builder: (context, state) => const Name()),
    GoRoute(path: "/tagLine", builder: (context, state) => const TagLine()),
  ]);
}
