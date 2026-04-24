part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {
  final UserModel userModel;

  SignInSuccess({required this.userModel});
}

final class SignInWithNotVerifiedEmail extends AuthState {
  final String warningMessage;
  SignInWithNotVerifiedEmail({required this.warningMessage});
}

final class SignInFailure extends AuthState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final UserModel userModel;

  SignUpSuccess({required this.userModel});
}

final class SignUpFailure extends AuthState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

final class SignOutLoading extends AuthState {}

final class SignOutSuccess extends AuthState {}

final class SignOutFailure extends AuthState {
  final String errMessage;
  SignOutFailure({required this.errMessage});
}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String errMessage;
  ResetPasswordFailure({required this.errMessage});
}

final class LoadCurrentUserLoading extends AuthState {}

final class LoadCurrentUserSuccess extends AuthState {
  final UserModel userModel;

  LoadCurrentUserSuccess({required this.userModel});
}

final class LoadCurrentUserFailure extends AuthState {
  final String errMessage;
  LoadCurrentUserFailure({required this.errMessage});
}

final class SignWithGoogleLoading extends AuthState {}

final class SignWithGoogleSuccess extends AuthState {}

final class SignWithGoogleFailure extends AuthState {
  final String errMessage;
  SignWithGoogleFailure({required this.errMessage});
}
