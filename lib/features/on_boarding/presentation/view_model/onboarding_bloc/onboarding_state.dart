part of 'onboarding_bloc.dart';

@immutable
class OnboardingState {
  final int pageIndex;
  final bool isLast;
  final bool navigateToHome;
  final bool navigateToAuth;

  const OnboardingState({
    required this.pageIndex,
    required this.isLast,
    this.navigateToHome = false,
    this.navigateToAuth = false,
  });

  OnboardingState copyWith({
    int? pageIndex,
    bool? isLast,
    bool? navigateToHome,
    bool? navigateToAuth,
  }) {
    return OnboardingState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLast: isLast ?? this.isLast,
      navigateToHome: navigateToHome ?? this.navigateToHome,
      navigateToAuth: navigateToAuth ?? this.navigateToAuth,
    );
  }
}
