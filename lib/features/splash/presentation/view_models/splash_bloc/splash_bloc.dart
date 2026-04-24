import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_hub_app/core/services/service_locator.dart';
import 'package:nti_hub_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository authRepo;

  SplashBloc(this.authRepo) : super(SplashInitial()) {
    on<StartSplash>((event, emit) async {
      emit(SplashLogoState());

      await Future.delayed(const Duration(milliseconds: 900));

      emit(SplashLoadingState());

      await Future.delayed(const Duration(milliseconds: 600));
      final prefs = getIt<SharedPreferences>();
      final isOnboardingSeen = prefs.getBool('seen_onboarding') ?? false;
      if (!isOnboardingSeen) {
        emit(NavigateToOnboarding());
      } else {
        final isAcive = await authRepo.isLoggedIn();
        if (isAcive) {
          emit(NavigateToHome());
        } else {
          emit(NavigateToAuth());
        }
      }
    });
  }
}
