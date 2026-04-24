import 'package:nti_hub_app/features/news/data/models/new_model.dart';

abstract class NewRepository {
  Stream<List<NewModel>> loadNews();
  Future<void> addNew(NewModel newModel);
}
