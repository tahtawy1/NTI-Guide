import 'package:nti_hub_app/features/on_boarding/data/datasources/onboarding_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDatasourceImp implements OnboardingLocalDatasource {
  final SharedPreferences prefs;

  OnboardingLocalDatasourceImp({required this.prefs});

  @override
  Future<void> setOnboardingSeen() async {
    await prefs.setBool('seen_onboarding', true);
  }

  @override
  bool isOnboardingSeen() {
    return prefs.getBool('seen_onboarding') ?? false;
  }
}
