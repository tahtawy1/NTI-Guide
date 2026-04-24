import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';

abstract class ProgramRepository {
  Future<List<ProgramModel>> loadPrograms();
}
