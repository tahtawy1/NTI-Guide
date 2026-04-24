import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:nti_hub_app/features/auth/data/models/user_model.dart';
import 'package:nti_hub_app/features/auth/data/repositories/auth_repository.dart';
import 'package:nti_hub_app/core/errors/firebase_auth_error_mapper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<SignOutEvent>(_signOut);
    on<GetCurrentUserEvent>(_getCurrentUserData);
    on<ResetPasswordEvent>(_resetPassword);
  }

  //* ===== Sign In =====
  Future<void> _signIn(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(SignInLoading());

      final user = await repo.signIn(event.email, event.password);

      if (user == null) {
        emit(SignInFailure(errMessage: 'Sign in failed. Please try again.'));
        return;
      }
      emit(SignInSuccess(userModel: user));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignInFailure(errMessage: FirebaseAuthErrorMapper.map(e.code)));
      } else {
        emit(SignInFailure(errMessage: e.toString()));
      }
    }
  }

  //* ===== Sign Up =====
  Future<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(SignUpLoading());

      final user = await repo.signUp(event.name, event.email, event.password);

      if (user == null) {
        emit(SignUpFailure(errMessage: 'Sign up failed. Please try again.'));
        return;
      }
      emit(SignUpSuccess(userModel: user));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignUpFailure(errMessage: FirebaseAuthErrorMapper.map(e.code)));
      } else {
        emit(SignUpFailure(errMessage: e.toString()));
      }
    }
  }

  //* ===== Sign Out =====
  Future<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(SignOutLoading());

      await repo.signOut();

      emit(SignOutSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignOutFailure(errMessage: FirebaseAuthErrorMapper.map(e.code)));
      } else {
        emit(SignOutFailure(errMessage: e.toString()));
      }
    }
  }

  //* ===== Reset Password =====
  Future<void> _resetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(ResetPasswordLoading());
      await repo.resetPassword(event.email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(
          ResetPasswordFailure(errMessage: FirebaseAuthErrorMapper.map(e.code)),
        );
      } else {
        emit(ResetPasswordFailure(errMessage: e.toString()));
      }
    }
  }

  //* ===== Get Current User =====
  Future<void> _getCurrentUserData(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(LoadCurrentUserLoading());
      final user = await repo.getCurrentUserData();
      if (user == null) {
        emit(LoadCurrentUserFailure(errMessage: 'User data not found.'));
        return;
      }
      emit(LoadCurrentUserSuccess(userModel: user));
    } catch (e) {
      emit(LoadCurrentUserFailure(errMessage: e.toString()));
    }
  }
}
