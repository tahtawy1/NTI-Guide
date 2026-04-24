import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_text_styles.dart';

class SplashLoadingWidget extends StatelessWidget {
  const SplashLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.onPrimary),
                backgroundColor: AppColors.onPrimaryHint,
              ),
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: AppColors.onPrimaryHint,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.splashInitializing,
          style: AppTextStyles.textXsMediumSpacedOnPrimary.copyWith(
            color: AppColors.onPrimaryMedium,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 96),
          child: LinearProgressIndicator(
            backgroundColor: AppColors.onPrimaryHint,
            color: AppColors.onPrimaryDisabled,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
