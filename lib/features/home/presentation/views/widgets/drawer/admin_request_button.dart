import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class AdminLoginButton extends StatelessWidget {
  const AdminLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.push(AppStrings.adminRequestRoute);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 44,
        width: double.infinity,
        child: Row(
          children: [
            const Icon(
              Icons.admin_panel_settings_outlined,
              color: AppColors.primary,
              size: 18,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: FittedBox(
                child: Text(
                  AppStrings.staffLoginTitle,
                  style: AppTextStyles.textMdSemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
