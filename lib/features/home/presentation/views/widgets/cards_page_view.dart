import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/carousel/carousel_indicator.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_card.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_section_header.dart';

class CardsPageView extends StatefulWidget {
  const CardsPageView({super.key, required this.programs});
  final List<ProgramModel> programs;
  @override
  State<CardsPageView> createState() => _CardsPageViewState();
}

class _CardsPageViewState extends State<CardsPageView> {
  final PageController pageController = PageController();
  int index = 0;

  List<String> get images =>
      widget.programs.map((program) => program.thumbnail).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomSectionHeader(
            title: AppStrings.capacityBuildingTitle,
            onTap: () {
              context.push(
                AppStrings.programsViewRoute,
                extra: widget.programs,
              );
            },
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 450,
          child: PageView.builder(
            onPageChanged: (value) {
              index = value;
              setState(() {});
            },
            itemCount: min(widget.programs.length, 3),
            itemBuilder: (_, i) {
              final program = widget.programs[i];
              final thumbUrl = program.thumbnail;

              return CustomCard(
                thumbUrl: thumbUrl,
                title: program.title,
                brief: program.brief ?? '',
                onTap: () {
                  context.push(AppStrings.programDetailsRoute, extra: program);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        CarouselIndicator(length: widget.programs.length, currentPage: index),
      ],
    );
  }
}
