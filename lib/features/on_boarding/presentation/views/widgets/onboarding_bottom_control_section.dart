import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/view_model/onboarding_bloc/onboarding_bloc.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBottomControlSection extends StatelessWidget {
  const OnBoardingBottomControlSection({super.key, required this.controller});
  final PageController controller;

  void _goNext(OnboardingBloc bloc, OnboardingState state) {
    if (state.isLast) {
      bloc.add(FinishOnboardingEvent());
    } else {
      bloc.add(NextPageEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    return Container(
      padding: const EdgeInsets.only(bottom: 16, right: 24, left: 24, top: 16),
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ScaleEffect(dotHeight: 8, dotWidth: 8),
          ),

          const SizedBox(height: 22),

          BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return OnboardingButton(
                title: state.pageIndex < 2 ? 'NEXT' : 'GET STARTED',
                onTap: () => _goNext(bloc, state),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
