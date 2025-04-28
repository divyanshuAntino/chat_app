// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final Data? data;
  final String? message;
  final int? status;

  AuthModel({
    this.data,
    this.message,
    this.status,
  });

  AuthModel copyWith({
    Data? data,
    String? message,
    int? status,
  }) =>
      AuthModel(
        data: data ?? this.data,
        message: message ?? this.message,
        status: status ?? this.status,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  final Token? token;
  final User? user;

  Data({
    this.token,
    this.user,
  });

  Data copyWith({
    Token? token,
    User? user,
  }) =>
      Data(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token?.toJson(),
        "user": user?.toJson(),
      };
}

class Token {
  final String? accessToken;
  final String? refreshToken;

  Token({
    this.accessToken,
    this.refreshToken,
  });

  Token copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Token(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class User {
  final String? id;
  final String? userEmail;
  final String? userName;

  User({
    this.id,
    this.userEmail,
    this.userName,
  });

  User copyWith({
    String? id,
    String? userEmail,
    String? userName,
  }) =>
      User(
        id: id ?? this.id,
        userEmail: userEmail ?? this.userEmail,
        userName: userName ?? this.userName,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userEmail: json["userEmail"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userEmail": userEmail,
        "userName": userName,
      };
}
