import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/fixed_image_widget.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView(
        children: [
          const SizedBox(height: 10),

          const FixedImageWidget(imagePath: AppAssets.onboardingImage1),
          const SizedBox(height: 24),
          Center(
            child: Text(
              AppStrings.onboardingTitleOne,
              style: AppTextStyles.textXxlExtraBoldTight.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 6),

          Text(
            AppStrings.onboardingDescOne,
            textAlign: TextAlign.center,
            style: AppTextStyles.textLgRegular.copyWith(
              color: AppColors.textBody,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
