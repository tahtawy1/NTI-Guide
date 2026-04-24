import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/auth/presentation/views/signIn/views/widgets/sign_in_form.dart';
import 'package:nti_hub_app/features/auth/presentation/views/widgets/navigation_between_auth.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                  'Welcome Back',
                  style: AppTextStyles.textXxlExtraBoldSpaced,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Sign in to continue learning',
                  style: AppTextStyles.text16Regular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const SignInForm(),
              const SizedBox(height: 10),

              NavigationBetweenAuth(
                description: "Don't have an account?",
                title: 'Sign Up',
                onTap: () {
                  context.go(AppStrings.signUp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
