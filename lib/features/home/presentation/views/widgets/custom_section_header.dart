import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class CustomSectionHeader extends StatelessWidget {
  const CustomSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28,
          width: 8,
          decoration: BoxDecoration(
            color: AppColors.darkPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: AppTextStyles.textLgExtraBold.apply(
            color: AppColors.darkPrimary,
          ),
        ),
        const SizedBox(height: 28),
        const Spacer(),
        IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.darkPrimary,
            size: 20,
          ),
        ),
      ],
    );
  }
}
