import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/data/models/hero_section_model.dart';

abstract class HeroRemoteDataSource {
  Stream<HeroSectionModel> getHero();
  Stream<List<ProgramModel>> getHeroPrograms(List<String> ids);
}
