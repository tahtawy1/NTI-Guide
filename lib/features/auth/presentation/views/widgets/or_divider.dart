import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Divider(),
        ),
        Container(
          height: 20,
          width: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.onPrimaryDisabled,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text('OR', style: AppTextStyles.textLgBold),
        ),
      ],
    );
  }
}
