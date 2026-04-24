import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/features/about_nti/presentation/views/widgets/about_nti_body.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_back_button.dart';

class AboutNtiView extends StatelessWidget {
  const AboutNtiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          AppStrings.aboutTitle,
          style: AppTextStyles.textLgBold.copyWith(
            color: AppColors.darkPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssets.ntiImg),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: AboutNtiBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
