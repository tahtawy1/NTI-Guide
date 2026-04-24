import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/card_button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.thumbUrl,
    required this.title,
    required this.brief,
    required this.onTap,
  });
  final String thumbUrl;
  final String title;
  final String brief;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 5)],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            child: Image.network(
              thumbUrl,
              fit: BoxFit.fill,
              height: 220,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                FittedBox(child: Text(title, style: AppTextStyles.textLgBold)),
                const SizedBox(height: 16),
                Flexible(
                  child: Text(
                    brief,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.text14Regular.copyWith(
                      color: AppColors.textBody,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CardButton(title: AppStrings.moreDetailsTitle, onTap: onTap),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
