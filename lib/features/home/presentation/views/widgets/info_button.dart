import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.title,
    required this.onTap,
    this.bgColor = AppColors.primary,
  });
  final String title;
  final VoidCallback onTap;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return bgColor == AppColors.primary
                  ? AppColors.primaryVariant
                  : bgColor.withAlpha(205);
            }
            return bgColor;
          }),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.textMdBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
