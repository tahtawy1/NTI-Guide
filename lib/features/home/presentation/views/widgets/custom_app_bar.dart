import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.normalLogo, height: 50);
  }
}
