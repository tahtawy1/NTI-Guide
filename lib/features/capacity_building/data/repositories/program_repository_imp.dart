import 'package:firebase_core/firebase_core.dart';
import 'package:nti_hub_app/core/errors/firestore_error_mapper.dart';
import 'package:nti_hub_app/core/errors/firestore_failure.dart';
import 'package:nti_hub_app/features/capacity_building/data/data_sources/programs_remote_datasource.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/repositories/program_repository.dart';

class ProgramRepositoryImp implements ProgramRepository {
  ProgramsRemoteDatasource datasource;
  ProgramRepositoryImp({required this.datasource});

  @override
  Future<List<ProgramModel>> loadPrograms() async {
    try {
      return await datasource.loadPrograms();
    } on FirebaseException catch (e) {
      throw FirestoreErrorMapper.handle(e);
    } catch (e) {
      throw FirestoreFailure('Unexpected error');
    }
  }
}
