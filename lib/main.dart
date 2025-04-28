import 'dart:async';
import 'dart:developer';
import 'package:chatapp/app/app.dart';
import 'package:chatapp/models/locale.dart';
import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/service/hive/hive.dart';
import 'package:chatapp/utils/bloc_observer/observer.dart';
import 'package:chatapp/utils/dependency_injection/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      //firebase crashlytics

      await EasyLocalization.ensureInitialized();
      setupLocator();
      final HiveBoxService hive = locator<HiveBoxService>();
      await hive.init();

      // To turn off landscape mode
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light // transparent status bar
            ),
      );

      Bloc.observer = const Observer();
      runApp(
        EasyLocalization(
          supportedLocales: supportedLocales,
          path: 'assets/translations',
          fallbackLocale: LocaleType.english,
          child: const App(),
        ),
      );
    },
    (e, stack) {
      log(
        e.toString(),
      );
    },
  );
}
