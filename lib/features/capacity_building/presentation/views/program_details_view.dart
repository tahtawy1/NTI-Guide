import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_back_button.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/info_button.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/about_bottom_sheet.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/faqs_bottom_sheet.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/partners_bottom_sheet.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/terms_bottom_sheet.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/tracks_bottom_sheet.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/site_expansion_tile_widget.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/view_model/open_link_and_exit_view_model.dart';

class ProgramDetailsView extends StatefulWidget {
  const ProgramDetailsView({super.key, required this.program});
  final ProgramModel program;

  @override
  State<ProgramDetailsView> createState() => _ProgramDetailsViewState();
}

class _ProgramDetailsViewState extends State<ProgramDetailsView> {
  late List<ExpansibleController> controllers;
  @override
  void initState() {
    super.initState();
    if (widget.program.hasSites == true && widget.program.sites != null) {
      controllers = List.generate(
        widget.program.sites!.length,
        (_) => ExpansibleController(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Program Details',
          style: AppTextStyles.textLgExtraBold.copyWith(
            color: AppColors.darkPrimary,
          ),
        ),
        centerTitle: true,
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              FittedBox(
                child: Text(
                  widget.program.title,
                  style: AppTextStyles.textXxlExtraBoldSpaced.copyWith(
                    color: AppColors.darkPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.program.description,
                style: AppTextStyles.textLgRegular.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: _buildInfoButtons(context),
              ),
              const SizedBox(height: 16),
              if (widget.program.hasSites == true &&
                  widget.program.sites != null)
                ...widget.program.sites!.asMap().entries.map((entry) {
                  int index = entry.key;
                  var site = entry.value;

                  return SiteExpansionTileWidget(
                    controllers: controllers,
                    index: index,
                    site: site,
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInfoButtons(BuildContext context) {
    return [
      if (widget.program.hasAbout)
        InfoButton(
          title: 'About the initiative',
          onTap: () {
            _showTracksBottomSheet(
              program: widget.program,
              context: context,
              child: AboutBottomSheet(program: widget.program),
            );
          },
        ),
      if (widget.program.hasTracks)
        InfoButton(
          title: 'Tracks',
          onTap: () {
            _showTracksBottomSheet(
              context: context,
              program: widget.program,
              child: TracksBottomSheet(program: widget.program),
            );
          },
        ),
      if (widget.program.hasPartners)
        InfoButton(
          title: 'Partners',
          onTap: () {
            _showTracksBottomSheet(
              context: context,
              program: widget.program,
              child: PartnersBottomSheet(program: widget.program),
            );
          },
        ),
      if (widget.program.hasTerms)
        InfoButton(
          title: 'Terms',
          bgColor: AppColors.darkRed,
          onTap: () {
            _showTracksBottomSheet(
              context: context,
              program: widget.program,
              child: TermsBottomSheet(program: widget.program),
            );
          },
        ),
      if (widget.program.hasFaqs)
        InfoButton(
          title: 'FAQs',
          onTap: () {
            _showTracksBottomSheet(
              context: context,
              program: widget.program,
              child: FaqsBottomSheet(program: widget.program),
            );
          },
        ),
      if (widget.program.hasTracksByGovernorate == true)
        InfoButton(
          title: 'Tracks by Governorate',
          onTap: () {
            OpenLinkAndExitViewModel.openLinkAndExit(
              widget.program.tracksGroup!.tracksGroupLink,
            );
          },
        ),
    ];
  }

  void _showTracksBottomSheet({
    required BuildContext context,
    required ProgramModel program,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.75,
          ),
          child: child,
        );
      },
    );
  }
}
