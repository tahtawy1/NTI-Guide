import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';

class FixedImageWidget extends StatelessWidget {
  const FixedImageWidget({super.key, required this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,

      // width: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryVariant.withAlpha(50),
            blurRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
