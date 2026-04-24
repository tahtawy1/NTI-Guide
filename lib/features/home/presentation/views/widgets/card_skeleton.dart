import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardSkeleton extends StatelessWidget {
  const CardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 206, 217, 232),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 5)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: AppColors.onPrimaryDisabled,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                height: 30,
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.onPrimaryDisabled,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                height: 15,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.onPrimaryDisabled,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 15,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.onPrimaryDisabled,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 55,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.onPrimaryDisabled,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
