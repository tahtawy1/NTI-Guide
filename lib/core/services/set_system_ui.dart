import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';

class SystemUiService {
  static void setSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.surfacePrimary,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
