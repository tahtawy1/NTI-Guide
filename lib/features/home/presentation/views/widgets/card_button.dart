import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class CardButton extends StatelessWidget {
  const CardButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.darkPrimary],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(50),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          title,
          style: AppTextStyles.textMdBoldWideOnPrimary.copyWith(
            color: AppColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
