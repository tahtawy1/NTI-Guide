import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';

class BottomSheetIcon extends StatelessWidget {
  const BottomSheetIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 5,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.textSecondary,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
