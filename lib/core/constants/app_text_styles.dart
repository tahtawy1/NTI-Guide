import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle textSmBoldWide = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static const TextStyle textMdSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textMdBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle textLgBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  //* === Regular ===
  static const TextStyle text12Regular = TextStyle(fontSize: 12);
  static const TextStyle text14Regular = TextStyle(fontSize: 14);
  static const TextStyle text16Regular = TextStyle(fontSize: 16);
  static const TextStyle textLgRegular = TextStyle(fontSize: 18);

  //* === Primary Headers ===
  static const TextStyle textLgExtraBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle textLgExtraBoldWide = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    letterSpacing: 1,
  );

  static const TextStyle textXlExtraBoldTight = TextStyle(
    fontSize: 24,
    letterSpacing: -0.40,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle textXxlExtraBoldTight = TextStyle(
    fontSize: 30,
    letterSpacing: -0.45,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle textXxlExtraBoldSpaced = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w900,
    letterSpacing: 1,
  );
  //* === On Primary ===
  static const TextStyle textMdBoldWideOnPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.4,
  );

  static const TextStyle textSmBoldOnPrimary = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textXsMediumSpacedOnPrimary = TextStyle(
    fontSize: 10.5,
    fontWeight: FontWeight.w500,
    letterSpacing: 3,
    height: 1.4,
  );
}
