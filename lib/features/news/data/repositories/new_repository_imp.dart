import 'package:nti_hub_app/features/news/data/datasources/new_remote_datasource.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';
import 'package:nti_hub_app/features/news/data/repositories/new_repository.dart';

class NewRepositoryImp implements NewRepository {
  final NewRemoteDatasource datasource;

  NewRepositoryImp({required this.datasource});

  @override
  Stream<List<NewModel>> loadNews() {
    return datasource.loadNews().map(
      // Sort by date descending: latest news first
      (news) => news..sort((a, b) => b.date.compareTo(a.date)),
    );
  }

  @override
  Future<void> addNew(NewModel newModel) async {
    return await datasource.addNew(newModel);
  }
}
