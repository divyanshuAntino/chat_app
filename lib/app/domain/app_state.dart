import 'package:chatapp/models/locale.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  final Locale? locale;
  const AppState({this.locale});

  @override
  List<Object?> get props => [locale];
}

final class AppInitialState extends AppState {
  AppInitialState()
      : super(
          locale: navigatorKey.currentContext?.locale ?? LocaleType.english,
        );
}
