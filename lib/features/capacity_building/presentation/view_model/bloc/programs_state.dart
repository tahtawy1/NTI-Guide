part of 'programs_bloc.dart';

@immutable
sealed class ProgramsState {}

final class ProgramsInitial extends ProgramsState {}

class LoadingPrograms extends ProgramsState {}

final class ProgramsLoaded extends ProgramsState {
  final List<ProgramModel> programs;
  ProgramsLoaded({required this.programs});
}

final class LoadProgramsError extends ProgramsState {
  final String errMessage;
  LoadProgramsError({required this.errMessage});
}
