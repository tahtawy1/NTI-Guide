part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

class SplashInitial extends SplashState {}

class SplashLogoState extends SplashState {}

class SplashLoadingState extends SplashState {}

class NavigateToOnboarding extends SplashState {}

class NavigateToAuth extends SplashState {}

class NavigateToHome extends SplashState {}
