part of 'hero_home_bloc.dart';

@immutable
sealed class HeroHomeState {}

final class HeroHomeInitial extends HeroHomeState {}

class ProgramHeroLoaded extends HeroHomeState {
  final HeroSectionModel heroModel;

  ProgramHeroLoaded({required this.heroModel});
}

final class ProgramHeroLoadFailure extends HeroHomeState {
  final String errMessage;

  ProgramHeroLoadFailure({required this.errMessage});
}

class HeroProgramsLoaded extends HeroHomeState {
  final List<ProgramModel> programs;

  HeroProgramsLoaded({required this.programs});
}

final class HeroLoadProgramsFailure extends HeroHomeState {
  final String errMessage;

  HeroLoadProgramsFailure({required this.errMessage});
}
