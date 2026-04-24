import 'package:nti_hub_app/features/news/data/models/new_model.dart';

abstract class NewRemoteDatasource {
  Stream<List<NewModel>> loadNews();
  Future<void> addNew(NewModel newModel);
}
