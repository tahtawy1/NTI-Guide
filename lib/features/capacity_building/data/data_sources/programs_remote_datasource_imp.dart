import 'dart:developer';

import 'package:nti_hub_app/core/errors/app_exception.dart';
import 'package:nti_hub_app/features/capacity_building/data/data_sources/programs_remote_datasource.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramsRemoteDatasourceImp extends ProgramsRemoteDatasource {
  final FirebaseFirestore firestore;
  ProgramsRemoteDatasourceImp({required this.firestore});

  @override
  Future<List<ProgramModel>> loadPrograms() async {
    try {
      final coll = firestore.collection('programs');

      final snapshot = await coll.get();
      return snapshot.docs
          .map((doc) => ProgramModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw AppException('Failed to load programs');
    }
  }
}
