part of 'hero_home_bloc.dart';

@immutable
sealed class HeroHomeEvent {}

class LoadProgramHeroEvent extends HeroHomeEvent {}

class LoadHeroProgramsEvent extends HeroHomeEvent {
  final List<String> ids;

  LoadHeroProgramsEvent({required this.ids});
}
