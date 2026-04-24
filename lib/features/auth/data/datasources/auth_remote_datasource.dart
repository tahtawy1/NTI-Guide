import '../models/user_model.dart';

abstract class AuthRemoteDatasource {
  /// Login with email and password
  Future<UserModel?> signIn(String email, String password);

  /// Create new account with email and password
  Future<UserModel?> signUp(String? name, String email, String password);

  /// Logout current user
  Future<void> signOut();

  Future<void> resetPassword(String email);

  Future<UserModel?> getCurrentUserData();

  Future<bool> isLoggedIn();
}
