part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

class StartSplash extends SplashEvent {}

class LogoAnimationFinished extends SplashEvent {}

class LoadingAnimationFinished extends SplashEvent {}
