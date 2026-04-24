import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/data/models/hero_section_model.dart';
import 'package:nti_hub_app/features/home/data/repositories/hero_section_repo/hero_section_repository.dart';

part 'hero_home_event.dart';
part 'hero_home_state.dart';

class HeroHomeBloc extends Bloc<HeroHomeEvent, HeroHomeState> {
  final HeroHomeRepository homerepo;

  HeroHomeBloc({required this.homerepo}) : super(HeroHomeInitial()) {
    on<LoadProgramHeroEvent>(_loadProgramHero);
    on<LoadHeroProgramsEvent>(_loadHeroPrograms);
  }

  Future<void> _loadProgramHero(
    LoadProgramHeroEvent event,
    Emitter<HeroHomeState> emit,
  ) async {
    await emit.forEach<HeroSectionModel>(
      homerepo.getHero(),
      onData: (hero) {
        add(LoadHeroProgramsEvent(ids: hero.programIds));
        return ProgramHeroLoaded(heroModel: hero);
      },
      onError: (error, stackTrace) =>
          ProgramHeroLoadFailure(errMessage: error.toString()),
    );
  }

  Future<void> _loadHeroPrograms(
    LoadHeroProgramsEvent event,
    Emitter<HeroHomeState> emit,
  ) async {
    await emit.forEach<List<ProgramModel>>(
      homerepo.getHeroPrograms(event.ids),
      onData: (programs) => HeroProgramsLoaded(programs: programs),
      onError: (error, stackTrace) =>
          HeroLoadProgramsFailure(errMessage: error.toString()),
    );
  }
}
