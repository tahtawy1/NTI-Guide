import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/view_model/onboarding_bloc/onboarding_bloc.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/page_one.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/page_three.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/page_two.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.controller});

  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listenWhen: (previous, current) =>
            previous.pageIndex != current.pageIndex ||
            previous.navigateToHome != current.navigateToHome ||
            previous.navigateToAuth != current.navigateToAuth,
        listener: (context, state) {
          controller.animateToPage(
            state.pageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          if (state.navigateToHome) {
            context.go(AppStrings.homeRoute);
          }
          if (state.navigateToAuth) {
            context.go(AppStrings.signInRoute);
          }
        },
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [PageOne(), PageTwo(), PageThree()],
        ),
      ),
    );
  }
}
