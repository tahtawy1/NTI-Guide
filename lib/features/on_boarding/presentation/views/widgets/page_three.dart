import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/fixed_image_widget.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          const FixedImageWidget(imagePath: AppAssets.onboardingImage3),

          Center(
            child: Text(
              'Easy Access to Courses',
              textAlign: TextAlign.center,
              style: AppTextStyles.textXxlExtraBoldTight.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Text(
            'View details, requirements, and apply directly through official links. Our platform streamlines your path to certification.',
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
