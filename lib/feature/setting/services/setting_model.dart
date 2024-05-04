import 'package:flutter/material.dart';

class SettingModel {
  final String? name;
  final Widget? icon;
  final VoidCallback? onPressed;
  SettingModel({this.name, this.onPressed, this.icon});
}
