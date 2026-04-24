import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_hub_app/core/errors/app_exception.dart';
import 'package:nti_hub_app/core/errors/firebase_auth_error_mapper.dart';
import 'package:nti_hub_app/core/errors/firestore_error_mapper.dart';
import 'package:nti_hub_app/features/news/data/datasources/new_remote_datasource.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';

class NewRemoteDatasourceImp extends NewRemoteDatasource {
  final FirebaseFirestore firestore;

  NewRemoteDatasourceImp({required this.firestore});

  @override
  Stream<List<NewModel>> loadNews() {
    return firestore
        .collection('news')
        .snapshots()
        .map((snapshot) {
          final List<NewModel> result = [];
          for (final doc in snapshot.docs) {
            try {
              result.add(NewModel.fromMap(doc.data()));
            } catch (_) {}
          }
          return result;
        })
        .handleError((error) {
          if (error is FirebaseException) {
            throw FirestoreErrorMapper.handle(error);
          }
          throw error;
        });
  }

  @override
  Future<void> addNew(NewModel newModel) async {
    try {
      await firestore.collection('news').add(newModel.toJson());
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw AppException(FirebaseAuthErrorMapper.map(e.code));
      }
      throw AppException("Unexpected error occurred");
    }
  }
}
