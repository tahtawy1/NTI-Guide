import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/features/about_nti/presentation/views/widgets/about_nti_section_card.dart';
import 'package:nti_hub_app/features/about_nti/presentation/views/widgets/about_nti_objectives_card.dart';
import 'package:nti_hub_app/features/about_nti/presentation/views/widgets/about_nti_person_card.dart';

class AboutNtiBody extends StatelessWidget {
  const AboutNtiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AboutNtiSectionCard(
          title: AppStrings.aboutTitle,
          body: AppStrings.aboutNtiDescription,
        ),
        SizedBox(height: 20),
        AboutNtiPersonCard(
          label: AppStrings.aboutChairmanLabel,
          name: AppStrings.aboutChairmanName,
          message: AppStrings.aboutChairmanMessage,
          icon: Icons.account_balance_outlined,
        ),
        SizedBox(height: 20),
        AboutNtiPersonCard(
          label: AppStrings.aboutDirectorLabel,
          name: AppStrings.aboutDirectorName,
          message: AppStrings.aboutDirectorMessage,
          icon: Icons.manage_accounts_outlined,
        ),
        SizedBox(height: 20),
        AboutNtiObjectivesCard(objectives: AppStrings.aboutObjectives),
        SizedBox(height: 20),
      ],
    );
  }
}
