import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';

abstract class ProgramsRemoteDatasource {
  Future<List<ProgramModel>> loadPrograms();
}
