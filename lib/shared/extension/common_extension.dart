import 'package:chatapp/core/api_client/api_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ObjectExtentions on Object? {
  String? get getErrorMessage {
    if (this is ApiException) {
      return (this as ApiException).errorMessage;
    }
    return null;
  }

  Color get toColor {
    return Color(
      int.tryParse(this?.toString() ?? '000000000') ?? 000000000,
    );
  }
}

extension SmartDateFormat on String? {
  String toSmartString() {
    if (this == null || this!.isEmpty) return '';

    try {
      final utcDate = DateTime.parse(this!);
      final date = utcDate.toLocal(); // Convert to local time

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(Duration(days: 1));
      final inputDate = DateTime(date.year, date.month, date.day);

      if (inputDate == today) {
        return DateFormat.jm().format(date); // e.g., 3:40 PM
      } else if (inputDate == yesterday) {
        return 'Yesterday';
      } else {
        return DateFormat.yMMMd().format(date); // e.g., Apr 20, 2025
      }
    } catch (_) {
      return '';
    }
  }
}
