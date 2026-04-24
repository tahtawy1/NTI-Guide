import 'package:nti_hub_app/features/on_boarding/data/datasources/onboarding_local_datasource.dart';
import 'package:nti_hub_app/features/on_boarding/data/repositories/onboarding_local_repo.dart';

class OnboardingLocalRepoImp implements OnboardingLocalRepo {
  final OnboardingLocalDatasource datasource;

  OnboardingLocalRepoImp({required this.datasource});

  @override
  bool isOnboardingSeen() {
    return datasource.isOnboardingSeen();
  }

  @override
  Future<void> setOnboardingSeen() async {
    return await datasource.setOnboardingSeen();
  }
}
