import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/auth/presentation/views/signIn/views/widgets/reset_password_form.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_back_button.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CustomBackButton()),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Reset Password",
                style: AppTextStyles.textXxlExtraBoldSpaced,
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Enter your email and we’ll send you a link to reset your password.",
                style: AppTextStyles.text14Regular.copyWith(
                  color: AppColors.textSecondaryVariant,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const ResetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
