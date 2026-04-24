import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.primaryVariant,
        onSecondary: AppColors.onPrimary,
        error: Colors.red,
        onError: AppColors.onPrimary,
        surface: AppColors.onPrimary,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        // backgroundColor: AppColors.primaryBlueDark,
        foregroundColor: AppColors.onPrimary,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
      primaryIconTheme: const IconThemeData(color: AppColors.primary),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryVariant;
            }
            return AppColors.primary;
          }),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryVariant;
            }
            return AppColors.primary;
          }),
          foregroundColor: WidgetStateProperty.all<Color>(AppColors.onPrimary),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: Border.all(color: AppColors.transparent),
      ),
      fontFamily: 'Manrope',
    );
  }
}
