// To parse this JSON data, do
//
//     final addUserModel = addUserModelFromJson(jsonString);

import 'dart:convert';

AddUserModel addUserModelFromJson(String str) =>
    AddUserModel.fromJson(json.decode(str));

String addUserModelToJson(AddUserModel data) => json.encode(data.toJson());

class AddUserModel {
  final List<Datum>? data;
  final String? message;
  final int? status;

  AddUserModel({
    this.data,
    this.message,
    this.status,
  });

  AddUserModel copyWith({
    List<Datum>? data,
    String? message,
    int? status,
  }) =>
      AddUserModel(
        data: data ?? this.data,
        message: message ?? this.message,
        status: status ?? this.status,
      );

  factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Datum {
  final String? userid;
  final String? useremail;
  final String? username;
  final String? userpassword;
  final dynamic userimage;
  final String? name;
  final dynamic dob;
  final String? tagline;

  Datum({
    this.userid,
    this.useremail,
    this.username,
    this.userpassword,
    this.userimage,
    this.name,
    this.dob,
    this.tagline,
  });

  Datum copyWith({
    String? userid,
    String? useremail,
    String? username,
    String? userpassword,
    dynamic userimage,
    String? name,
    dynamic dob,
    String? tagline,
  }) =>
      Datum(
        userid: userid ?? this.userid,
        useremail: useremail ?? this.useremail,
        username: username ?? this.username,
        userpassword: userpassword ?? this.userpassword,
        userimage: userimage ?? this.userimage,
        name: name ?? this.name,
        dob: dob ?? this.dob,
        tagline: tagline ?? this.tagline,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userid: json["userid"],
        useremail: json["useremail"],
        username: json["username"],
        userpassword: json["userpassword"],
        userimage: json["userimage"],
        name: json["name"],
        dob: json["dob"],
        tagline: json["tagline"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "useremail": useremail,
        "username": username,
        "userpassword": userpassword,
        "userimage": userimage,
        "name": name,
        "dob": dob,
        "tagline": tagline,
      };
}
