import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/auth/model/auth_model.dart';
import 'package:chatapp/shared/field_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AuthState extends Equatable {
  final ApiStatus apiStatus;
  final String accessToken;
  final FieldState<TextEditingController> nameController;
  final FieldState<TextEditingController> emailController;
  final FieldState<TextEditingController> passwordController;
  final AuthModel? authModel;
  final String userId;
  const AuthState({
    required this.apiStatus,
    required this.accessToken,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    this.authModel,
    required this.userId,
  });
  factory AuthState.init() {
    return AuthState(
      apiStatus: ApiStatus.int,
      accessToken: '',
      nameController: FieldState.initial(
        value: TextEditingController(text: ""),
      ),
      emailController: FieldState.initial(
        value: TextEditingController(text: ""),
      ),
      passwordController: FieldState.initial(
        value: TextEditingController(text: ""),
      ),
      authModel: null,
      userId: '',
    );
  }
  AuthState copyWith({
    ApiStatus? apiStatus,
    String? accessToken,
    FieldState<TextEditingController>? nameController,
    FieldState<TextEditingController>? emailController,
    FieldState<TextEditingController>? passwordController,
    AuthModel? authModel,
    String? userId,
  }) {
    return AuthState(
      apiStatus: apiStatus ?? this.apiStatus,
      accessToken: accessToken ?? this.accessToken,
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      authModel: authModel ?? this.authModel,
      userId: userId ?? this.userId,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        apiStatus,
        accessToken,
        nameController,
        emailController,
        passwordController,
        authModel,
        userId,
      ];
}
