import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 35,
        width: 35,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.textSecondary.withAlpha(30),
          shape: BoxShape.circle,
          boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 5)],
        ),
        child: const Icon(
          Icons.chevron_left_rounded,
          color: AppColors.primary,
          size: 30,
        ),
      ),
    );
  }
}
