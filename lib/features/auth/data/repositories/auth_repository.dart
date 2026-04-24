import 'package:nti_hub_app/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  //* ===== Sign Up =====
  Future<UserModel?> signUp(String name, String email, String password);

  //* ===== Sign In =====
  Future<UserModel?> signIn(String email, String password);
  //* ===== Sign Out =====
  Future<void> signOut();

  //* ===== Reset Password =====
  Future<void> resetPassword(String email);

  //* ===== Get curent user ==
  Future<UserModel?> getCurrentUserData();

  Future<bool> isLoggedIn();
}
