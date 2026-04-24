import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';

/// A horizontal card used in the full programs list screen.
class ProgramListItem extends StatelessWidget {
  const ProgramListItem({
    super.key,
    required this.onTap,
    required this.program,
  });

  final ProgramModel program;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.onPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 6)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: program.thumbnail.isNotEmpty
                  ? Image.network(
                      program.thumbnail,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) return child;
                        return _ThumbPlaceholder();
                      },
                      errorBuilder: (_, _, _) => _ThumbPlaceholder(),
                    )
                  : _ThumbPlaceholder(),
            ),
            // ── Text content ─────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        Text(
                          program.title,
                          style: AppTextStyles.textMdBold.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      program.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.text14Regular.copyWith(
                        color: AppColors.textPrimaryVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppStrings.moreDetailsTitle,
                        style: AppTextStyles.textSmBoldOnPrimary.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThumbPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      color: AppColors.primary.withAlpha(20),
      child: const Icon(
        Icons.article_outlined,
        size: 32,
        color: AppColors.primary,
      ),
    );
  }
}
