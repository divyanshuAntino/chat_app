import 'package:chatapp/app/domain/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  void changeLocale(Locale locale) {
    emit(AppState(locale: locale));
  }
}
