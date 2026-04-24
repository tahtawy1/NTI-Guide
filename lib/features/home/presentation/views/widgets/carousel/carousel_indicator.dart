import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.currentPage,
    required this.length,
  });
  final int length;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final isActive = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 20 : 8,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isActive ? AppColors.primary : AppColors.textSecondary,
          ),
        );
      }),
    );
  }
}
