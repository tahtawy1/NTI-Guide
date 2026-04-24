import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required this.onTap, required this.title});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.textMdBoldWideOnPrimary.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
            const SizedBox(width: 3),
            const Icon(Icons.arrow_forward, color: AppColors.onPrimary, size: 16),
          ],
        ),
      ),
    );
  }
}
