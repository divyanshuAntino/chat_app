import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/feature/auth/screen/auth.dart';
import 'package:chatapp/feature/home/screen/home.dart';
import 'package:chatapp/navbar/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  app = await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAUlzbXst1ZHLVsf3aJgwYx392kBPrJyrg",
          authDomain: "chatapp-3f335.firebaseapp.com",
          projectId: "chatapp-3f335",
          storageBucket: "chatapp-3f335.appspot.com",
          messagingSenderId: "225156356600",
          appId: "1:225156356600:web:04556fc30fb0aab34c9e0d",
          measurementId: "G-52B52LCW3Q"));
  // } else {
  //   app = await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  // }
  auth = FirebaseAuth.instanceFor(app: app);

  if (shouldUseFirebaseEmulator) {
    await auth.useAuthEmulator('localhost', 9099);
  }
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: constant.primary,
      systemNavigationBarColor: const Color.fromARGB(0, 255, 255, 255),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
