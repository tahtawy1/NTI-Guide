part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class LoadNewsEvent extends NewsEvent {}

class AddNewsEvent extends NewsEvent {
  final NewModel newNew;
  AddNewsEvent({required this.newNew});
}
