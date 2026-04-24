import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

enum CSnackType { success, warning, error }

class CSnackBar {
  static void showSnackBar(
    BuildContext context, {
    required String message,

    String? name,
    required CSnackType type,
  }) {
    {
      final List<Color> color = getColor(type);

      final snackBar = SnackBar(
        elevation: 0,

        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                overflow: TextOverflow.ellipsis,
                message,
                style: AppTextStyles.textMdSemiBold.apply(
                  color: color[0],
                  fontSizeDelta: 2,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: color[1],
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  static List<Color> getColor(CSnackType type) {
    Color color;
    Color bgColor;
    switch (type) {
      case CSnackType.success:
        color = AppColors.kSuccessColor;
        bgColor = AppColors.kSuccessColor.withAlpha(50);
        break;
      case CSnackType.warning:
        color = AppColors.kWarningColor;
        bgColor = AppColors.kWarningColor.withAlpha(50);
        break;
      case CSnackType.error:
        color = AppColors.kErrorColor;
        bgColor = AppColors.kErrorColor.withAlpha(50);
    }
    return [color, bgColor];
  }
}
