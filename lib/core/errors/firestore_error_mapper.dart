import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nti_hub_app/core/errors/failure.dart';
import 'package:nti_hub_app/core/errors/firestore_failure.dart';
import 'package:nti_hub_app/core/errors/network_failure.dart';

class FirestoreErrorMapper {
  static Failure handle(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirestoreFailure(
          "Access denied. You don't have permission to access this resource.",
        );

      case 'unavailable':
        return NetworkFailure("Please check your internet connection.");

      case 'not-found':
        return FirestoreFailure("Data not found.");

      default:
        return FirestoreFailure("An unexpected error occurred.");
    }
  }
}
