import 'package:nti_hub_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:nti_hub_app/features/auth/data/models/user_model.dart';
import 'package:nti_hub_app/features/auth/data/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImp({required this.datasource});
  @override
  Future<UserModel?> getCurrentUserData() async {
    return await datasource.getCurrentUserData();
  }

  @override
  Future<void> resetPassword(String email) async {
    await datasource.resetPassword(email);
  }

  @override
  Future<UserModel?> signIn(String email, String password) async {
    return await datasource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    return await datasource.signOut();
  }

  @override
  Future<UserModel?> signUp(String? name, String email, String password) async {
    return await datasource.signUp(name, email, password);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await datasource.isLoggedIn();
  }
}
