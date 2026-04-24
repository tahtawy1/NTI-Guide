import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';
import 'package:nti_hub_app/features/news/data/repositories/new_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewRepository repo;

  NewsBloc({required this.repo}) : super(NewsInitial()) {
    on<LoadNewsEvent>(_onLoadNews);
    on<AddNewsEvent>(_onAddNews);
  }

  Future<void> _onLoadNews(LoadNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await emit.forEach<List<NewModel>>(
      repo.loadNews(),
      onData: (news) => NewsLoaded(news: news),
      onError: (error, _) => NewsError(message: error.toString()),
    );
  }

  Future<void> _onAddNews(AddNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      await repo.addNew(event.newNew);
      add(LoadNewsEvent());
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}
