import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/bottom_sheet_icon.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_close_button.dart';

class FaqsBottomSheet extends StatelessWidget {
  const FaqsBottomSheet({super.key, required this.program});
  final ProgramModel program;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetIcon(),
            Text(
              'Frequently Asked Questions',
              style: AppTextStyles.textLgExtraBoldWide.copyWith(
                color: AppColors.darkPrimary,
              ),
            ),
            const SizedBox(height: 12),
            ...program.faqs!.map(
              (faq) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Icon(
                            Icons.circle,
                            color: AppColors.primary,
                            size: 8,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            faq.question,
                            style: AppTextStyles.textMdBold.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        faq.answer,
                        style: AppTextStyles.textMdBold.copyWith(
                          color: AppColors.textBody,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            const CustomCloseButton(),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
