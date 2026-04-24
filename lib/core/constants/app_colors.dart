import 'package:flutter/material.dart';

abstract class AppColors {
  //* === Brand ===
  static const Color primary = Color(0xff1E64AF);
  static const Color darkPrimary = Color(0xff1E3A8A);

  static const Color primaryVariant = Color(0xFF1E88E5);

  //* === Text ===
  static const Color textSecondary = Color(0xff64748B);
  static const Color textSecondaryVariant = Color(0xff94A3B8);
  static const Color textBody = Color(0xff43474F);
  static const Color textPrimary = Color(0xff191C1E);
  static const Color textPrimaryVariant = Color(0xff334155);

  //* === Colors on Background ===
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryMedium = Color(0xB3FFFFFF);
  static const Color onPrimaryDisabled = Color(0x80FFFFFF);
  static const Color onPrimaryHint = Color(0x4DFFFFFF);

  //* === Backgronds ===
  static const Color background = Color(0xffF8FAFC);
  static const Color surfacePrimary = Color(0xff1E64AF);

  static const Color loadingIndicator = Color(0xFFFFFFFF);
  static const Color loadingTrack = Color(0x4DFFFFFF);

  static const Color transparent = Colors.transparent;
  static const Color shadowColor = Color(0x08000000);

  static const Color darkRed = Color(0xffbb1616);

  static const kErrorColor = Colors.red;
  static const kSuccessColor = Colors.green;
  static const kWarningColor = Color(0xffFABC05);
  // static const kErrorBgColor = kErrorColor.withAlpha(30);
  // static const kSuccessBgColor = Color(0xff1F2D27);
  // static const kWarningBgColor = Color(0xff3A321D);
}
