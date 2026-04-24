import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/onboarding_app_bar.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/onboarding_bottom_control_section.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/onboarding_page_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ================= Onboarding App Bar =================
      appBar: AppBar(title: const OnBoardingAppBar()),
      body: Column(
        children: [
          /// ================= PAGE VIEW =================
          OnboardingPageView(controller: controller),

          /// ================= BOTTOM =================
          Stack(
            children: [
              Positioned(
                bottom: -15,
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary.withAlpha(50),
                      width: 25,
                    ),
                    // color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              OnBoardingBottomControlSection(controller: controller),
            ],
          ),
        ],
      ),
    );
  }
}
