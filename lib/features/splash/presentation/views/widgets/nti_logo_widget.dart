import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';

class NtiLogoWidget extends StatelessWidget {
  const NtiLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.ntiLogoRevercedColors,
      width: 280,
      height: 280,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox(
          width: 280,
          height: 280,
          child: Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.onPrimary,
              size: 48,
            ),
          ),
        );
      },
    );
  }
}
