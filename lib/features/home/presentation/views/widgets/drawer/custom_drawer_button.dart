import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/home/data/models/item_model.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    super.key,
    required this.item,
    required this.onTap,
  });
  final ItemModel item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 44,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(item.icon, color: AppColors.textPrimaryVariant, size: 18),
            const SizedBox(width: 10),
            Text(
              item.title,
              style: AppTextStyles.textMdSemiBold.copyWith(
                color: AppColors.textPrimaryVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
