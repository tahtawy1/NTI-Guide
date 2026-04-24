import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/auth/presentation/views/signUp/views/sign_up_form.dart';
import 'package:nti_hub_app/features/auth/presentation/views/widgets/navigation_between_auth.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Create Account',
                  style: AppTextStyles.textXxlExtraBoldSpaced,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Sign up to start learning',
                  style: AppTextStyles.text16Regular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const SignUpForm(),
              const SizedBox(height: 10),

              NavigationBetweenAuth(
                description: "Already have an account?",
                title: 'Sign in',
                onTap: () {
                  context.go(AppStrings.signInRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
