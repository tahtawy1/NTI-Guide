part of 'programs_bloc.dart';

@immutable
sealed class ProgramsEvent {}

class LoadProgramsEvent extends ProgramsEvent {}
