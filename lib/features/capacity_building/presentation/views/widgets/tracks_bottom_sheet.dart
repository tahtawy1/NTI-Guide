import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/bottom_sheet_icon.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_close_button.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/view_model/open_link_and_exit_view_model.dart';

class TracksBottomSheet extends StatelessWidget {
  const TracksBottomSheet({super.key, required this.program});
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
              'Categories',
              style: AppTextStyles.textLgExtraBoldWide.copyWith(
                color: AppColors.darkPrimary,
              ),
            ),

            const SizedBox(height: 12),

            ...program.tracks!.map(
              (track) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    track.title,
                    style: AppTextStyles.textMdBoldWideOnPrimary.copyWith(
                      color: AppColors.textPrimaryVariant,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      OpenLinkAndExitViewModel.openLinkAndExit(
                        track.trackLink!,
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  ),
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
