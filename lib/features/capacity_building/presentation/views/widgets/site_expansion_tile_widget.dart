import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/site_model.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/site_map_widget.dart';

class SiteExpansionTileWidget extends StatelessWidget {
  const SiteExpansionTileWidget({
    super.key,
    required this.controllers,
    required this.index,
    required this.site,
  });

  final List<ExpansibleController> controllers;
  final int index;
  final SiteModel site;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: controllers[index],

      splashColor: AppColors.transparent,
      title: Text(
        site.title,
        style: AppTextStyles.textMdBold.copyWith(color: AppColors.darkRed),
      ),

      onExpansionChanged: (isExpanded) {
        if (isExpanded) {
          for (int i = 0; i < controllers.length; i++) {
            if (i != index) {
              controllers[i].collapse();
            }
          }
        }
      },

      children: [
        SizedBox(
          height: 200,
          child: SiteMapWidget(
            latitude: site.latitude,
            longitude: site.longitude,
            title: site.title,
          ),
        ),
      ],
    );
  }
}
