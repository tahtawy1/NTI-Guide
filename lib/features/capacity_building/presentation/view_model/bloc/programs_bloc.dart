import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/repositories/program_repository.dart';

part 'programs_event.dart';
part 'programs_state.dart';

class ProgramsBloc extends Bloc<ProgramsEvent, ProgramsState> {
  final ProgramRepository repo;
  ProgramsBloc({required this.repo}) : super(ProgramsInitial()) {
    on<LoadProgramsEvent>((event, emit) async {
      await loadPrograms(emit);
    });
  }

  Future<void> loadPrograms(Emitter<ProgramsState> emit) async {
    try {
      emit(LoadingPrograms());
      final programs = await repo.loadPrograms();

      emit(ProgramsLoaded(programs: programs));
    } catch (e) {
      emit(LoadProgramsError(errMessage: e.toString()));
    }
  }
}
