import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Forgot Password?',
        style: AppTextStyles.text14Regular.apply(color: AppColors.primary),
      ),
      onPressed: () {
        context.push(AppStrings.resetPasswordRoute);
      },
    );
  }
}
