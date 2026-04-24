import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/fixed_image_widget.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          const FixedImageWidget(imagePath: AppAssets.onboardingImage2),
          const SizedBox(height: 12),

          Center(
            child: Text(
              AppStrings.onboardingTitleTwo,
              style: AppTextStyles.textXxlExtraBoldTight.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 6),

          Text(
            AppStrings.onboardingDescTwo,
            textAlign: TextAlign.center,
            style: AppTextStyles.textLgRegular.copyWith(
              color: AppColors.textBody,
            ),
          ),
        ],
      ),
    );
  }
}
