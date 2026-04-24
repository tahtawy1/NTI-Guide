import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final bool isLoading;
  final Color color;
  final double height;
  final double radius;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isLoading = false,
    this.height = 52,
    this.color = AppColors.primary,
    this.radius = 12,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Color(0x09000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(radius),
        ),
        child: isLoading
            ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(
                title,
                style: AppTextStyles.textMdBold.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
      ),
    );
  }
}
