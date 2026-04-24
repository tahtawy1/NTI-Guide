import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';

class OperationImageWidget extends StatelessWidget {
  const OperationImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 120,
        width: 120,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        // child: Image.asset(AppAssets.resetPasswordIcon),
      ),
    );
  }
}
