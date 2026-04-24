import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/view_model/onboarding_bloc/onboarding_bloc.dart';

class OnBoardingAppBar extends StatelessWidget {
  const OnBoardingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return Row(
      children: [
        Image.asset(AppAssets.normalLogo, height: 45),
        const Spacer(),
        TextButton(
          onPressed: () => bloc.add(FinishOnboardingEvent()),
          child: Text(
            'Skip',
            style: AppTextStyles.textMdBold.copyWith(color: AppColors.textBody),
          ),
        ),
      ],
    );
  }
}
