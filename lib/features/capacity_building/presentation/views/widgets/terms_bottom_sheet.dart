import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/bottom_sheet_icon.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_close_button.dart';

class TermsBottomSheet extends StatelessWidget {
  const TermsBottomSheet({super.key, required this.program});
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
              'Terms and General Regulations Governing the Initiative',
              style: AppTextStyles.textLgExtraBoldWide.copyWith(
                color: AppColors.darkPrimary,
              ),
            ),

            const SizedBox(height: 12),

            ...program.terms!.map(
              (term) => Padding(
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
                            color: AppColors.textPrimary,
                            size: 8,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            term.term,
                            style: AppTextStyles.textMdBold.copyWith(
                              color: AppColors.textPrimaryVariant,
                            ),
                          ),
                        ),
                      ],
                    ),

                    if (term.subTerms.isNotEmpty)
                      ...term.subTerms.map(
                        (subTerm) => Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            '• - $subTerm',
                            style: AppTextStyles.textMdBold.copyWith(
                              color: AppColors.textPrimaryVariant,
                            ),
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
