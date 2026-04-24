import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class NavigationBetweenAuth extends StatelessWidget {
  const NavigationBetweenAuth({
    super.key,
    required this.description,
    required this.title,
    required this.onTap,
  });
  final String description;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(description, style: AppTextStyles.text14Regular),
        const SizedBox(width: 8),
        TextButton(
          onPressed: onTap,
          child: Text(
            title,
            style: AppTextStyles.text14Regular.apply(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
