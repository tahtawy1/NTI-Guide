import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_hub_app/features/auth/data/repositories/auth_repository.dart';
import 'package:nti_hub_app/features/on_boarding/data/repositories/onboarding_local_repo.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingLocalRepo repo;
  final AuthRepository authRepo;

  OnboardingBloc({required this.repo, required this.authRepo})
    : super(const OnboardingState(pageIndex: 0, isLast: false)) {
    on<NextPageEvent>((event, emit) {
      final pageIndex = state.pageIndex + 1;

      emit(OnboardingState(pageIndex: pageIndex, isLast: pageIndex == 2));
    });

    on<FinishOnboardingEvent>((event, emit) async {
      await repo.setOnboardingSeen();
      final isActive = await authRepo.isLoggedIn();
      if (isActive) {
        emit(state.copyWith(navigateToHome: true));
      } else {
        emit(state.copyWith(navigateToAuth: true));
      }
      emit(const OnboardingState(pageIndex: 2, isLast: true));
    });
  }
}
