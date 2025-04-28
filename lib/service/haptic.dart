part of '../shared/widget/button/app_clickable.dart';

class AppHapticService {
  AppHapticService._();

  void hapticLight() {
    HapticFeedback.lightImpact();
  }

  void hapticMedium() {
    HapticFeedback.mediumImpact();
  }

  void hapticHeavy() {
    HapticFeedback.heavyImpact();
  }

  void hapticVibrate() {
    HapticFeedback.vibrate();
  }

  void selectionClick() {
    HapticFeedback.selectionClick();
  }
}
