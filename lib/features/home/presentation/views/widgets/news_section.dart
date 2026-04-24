// ignore: library_prefixes
import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_section_header.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/new_card.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key, required this.news});

  final List<NewModel> news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionHeader(
          title: AppStrings.newsTitle,
          onTap: () {
            context.push(AppStrings.newsRoute);
          },
        ),
        const SizedBox(height: 20),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Math.min(3, news.length),
          itemBuilder: (context, index) {
            return NewCard(currentNew: news[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ],
    );
  }
}
