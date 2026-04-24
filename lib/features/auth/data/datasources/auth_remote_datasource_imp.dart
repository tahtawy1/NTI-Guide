import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_hub_app/core/errors/app_exception.dart';
import 'package:nti_hub_app/core/errors/firebase_auth_error_mapper.dart';
import '../models/user_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImp implements AuthRemoteDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  late final CollectionReference<Map<String, dynamic>> usersColl = firestore
      .collection('users');

  AuthRemoteDatasourceImp({required this.auth, required this.firestore});
  @override
  Future<UserModel?> signUp(String? name, String email, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser == null) return null;

      // === Check if user is admin ===

      final String role;
      if (await isOwner(email)) {
        role = 'owner';
      } else if (await isAdmin(email)) {
        role = 'admin';
      } else {
        role = 'user';
      }
      final userModel = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? email,
        name: name ?? email.split('@')[0],
        role: role,
      );
      await firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(userModel.toJson());

      return userModel;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AppException(FirebaseAuthErrorMapper.map(e.code));
      }
      throw AppException("Unexpected error occurred");
    }
  }

  @override
  Future<UserModel?> signIn(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser == null) return null;

      final userDoc = await firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      if (!userDoc.exists) {
        throw AppException("User data not found in Firestore");
      }

      return UserModel.fromJson(userDoc.data()!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AppException(FirebaseAuthErrorMapper.map(e.code));
      }
      throw AppException("Unexpected error occurred");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AppException(FirebaseAuthErrorMapper.map(e.code));
      }
      throw AppException("Unexpected error occurred");
    }
  }

  Future<bool> isOwner(String email) async {
    try {
      final ownerDoc = await firestore.collection('config').doc('owners').get();
      final ownerEmail = List<String>.from(ownerDoc['emails'] ?? []);
      return ownerEmail.contains(email);
    } catch (e) {
      return false;
    }
  }

  Future<bool> isAdmin(String email) async {
    try {
      final adminDoc = await firestore.collection('config').doc('admins').get();
      final adminsEmails = List<String>.from(adminDoc['emails'] ?? []);
      return adminsEmails.contains(email);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AppException(FirebaseAuthErrorMapper.map(e.code));
      }
      throw AppException("Unexpected error occurred");
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        throw AppException('User not found');
      }
      final userDoc = await usersColl.doc(user.uid).get();
      if (!userDoc.exists) {
        throw AppException('User document not found');
      }
      final data = userDoc.data()!;
      return UserModel(
        uid: user.uid,
        name: data['name'] ?? '',
        email: data['email'] ?? user.email ?? '',
        role: data['role'] ?? 'user',
      );
    } catch (e) {
      throw AppException("Unexpected error occurred");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final user = auth.currentUser;
      return user != null;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AppException(FirebaseAuthErrorMapper.map(e.code));
      }
      throw AppException("Unexpected error occurred");
    }
  }
}
