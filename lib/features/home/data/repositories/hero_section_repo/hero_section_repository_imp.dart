import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nti_hub_app/core/errors/firestore_error_mapper.dart';
import 'package:nti_hub_app/core/errors/firestore_failure.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/data/datasources/hero_remote_datasource/hero_remote_datasource.dart';
import 'package:nti_hub_app/features/home/data/models/hero_section_model.dart';
import 'package:nti_hub_app/features/home/data/repositories/hero_section_repo/hero_section_repository.dart';

class HeroSectionRepositoryImp implements HeroHomeRepository {
  final HeroRemoteDataSource dataSource;

  HeroSectionRepositoryImp({required this.dataSource});
  @override
  Stream<HeroSectionModel> getHero() {
    try {
      return dataSource.getHero();
    } on FirebaseException catch (e) {
      throw FirestoreErrorMapper.handle(e);
    } catch (e) {
      throw FirestoreFailure('Unexpected error');
    }
  }

  @override
  Stream<List<ProgramModel>> getHeroPrograms(List<String> ids) {
    try {
      return dataSource.getHeroPrograms(ids);
    } on FirebaseException catch (e) {
      throw FirestoreErrorMapper.handle(e);
    } catch (e) {
      throw FirestoreFailure('Unexpected error');
    }
  }
}
