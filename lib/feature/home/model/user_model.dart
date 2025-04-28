// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  final Data? data;
  final String? message;
  final int? status;

  UserProfile({
    this.data,
    this.message,
    this.status,
  });

  UserProfile copyWith({
    Data? data,
    String? message,
    int? status,
  }) =>
      UserProfile(
        data: data ?? this.data,
        message: message ?? this.message,
        status: status ?? this.status,
      );

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
  final String? userid;
  final String? useremail;
  final dynamic username;
  final String? userpassword;
  final dynamic userimage;
  final String? name;
  final dynamic dob;
  final dynamic tagline;

  Data({
    this.userid,
    this.useremail,
    this.username,
    this.userpassword,
    this.userimage,
    this.name,
    this.dob,
    this.tagline,
  });

  Data copyWith({
    String? userid,
    String? useremail,
    dynamic username,
    String? userpassword,
    dynamic userimage,
    String? name,
    dynamic dob,
    dynamic tagline,
  }) =>
      Data(
        userid: userid ?? this.userid,
        useremail: useremail ?? this.useremail,
        username: username ?? this.username,
        userpassword: userpassword ?? this.userpassword,
        userimage: userimage ?? this.userimage,
        name: name ?? this.name,
        dob: dob ?? this.dob,
        tagline: tagline ?? this.tagline,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
