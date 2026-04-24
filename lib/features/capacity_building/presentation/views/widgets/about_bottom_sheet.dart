import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/bottom_sheet_icon.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_close_button.dart';

class AboutBottomSheet extends StatelessWidget {
  const AboutBottomSheet({super.key, required this.program});
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
              'About the initiative',
              style: AppTextStyles.textLgExtraBoldWide.copyWith(
                color: AppColors.darkPrimary,
              ),
            ),

            const SizedBox(height: 12),
            Text(
              program.about?.description ?? '',
              style: AppTextStyles.textMdBold.copyWith(
                color: AppColors.textBody,
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
