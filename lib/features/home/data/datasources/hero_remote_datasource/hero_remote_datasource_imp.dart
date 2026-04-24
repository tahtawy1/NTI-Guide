import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/data/datasources/hero_remote_datasource/hero_remote_datasource.dart';
import 'package:nti_hub_app/features/home/data/models/hero_section_model.dart';

class HeroRemoteDataSourceImpl implements HeroRemoteDataSource {
  final FirebaseFirestore firestore;

  HeroRemoteDataSourceImpl({required this.firestore});

  @override
  Stream<HeroSectionModel> getHero() {
    return firestore.collection('hero_sections').doc('home').snapshots().map((
      doc,
    ) {
      final data = doc.data();

      if (data == null) {
        return HeroSectionModel(programIds: []);
      }

      return HeroSectionModel.fromJson(data);
    });
  }

  @override
  Stream<List<ProgramModel>> getHeroPrograms(List<String> ids) {
    return firestore
        .collection('programs')
        .where(FieldPath.documentId, whereIn: ids) //! Maximum 10 docs
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ProgramModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
