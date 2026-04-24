import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:nti_hub_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:nti_hub_app/features/auth/data/datasources/auth_remote_datasource_imp.dart';
import 'package:nti_hub_app/features/auth/data/repositories/auth_repository.dart';
import 'package:nti_hub_app/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:nti_hub_app/features/auth/presentation/view_models/blocs/auth_bloc.dart';
import 'package:nti_hub_app/features/capacity_building/data/data_sources/programs_remote_datasource.dart';
import 'package:nti_hub_app/features/capacity_building/data/data_sources/programs_remote_datasource_imp.dart';
import 'package:nti_hub_app/features/capacity_building/data/repositories/program_repository.dart';
import 'package:nti_hub_app/features/capacity_building/data/repositories/program_repository_imp.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/view_model/bloc/programs_bloc.dart';
import 'package:nti_hub_app/features/home/data/datasources/hero_remote_datasource/hero_remote_datasource.dart';
import 'package:nti_hub_app/features/home/data/datasources/hero_remote_datasource/hero_remote_datasource_imp.dart';
import 'package:nti_hub_app/features/home/data/repositories/hero_section_repo/hero_section_repository.dart';
import 'package:nti_hub_app/features/home/data/repositories/hero_section_repo/hero_section_repository_imp.dart';
import 'package:nti_hub_app/features/home/presentation/view_model/hero_section_bloc/hero_home_bloc.dart';
import 'package:nti_hub_app/features/news/data/datasources/new_remote_datasource.dart';
import 'package:nti_hub_app/features/news/data/datasources/new_remote_datasource_imp.dart';
import 'package:nti_hub_app/features/news/data/repositories/new_repository.dart';
import 'package:nti_hub_app/features/news/data/repositories/new_repository_imp.dart';
import 'package:nti_hub_app/features/news/presentation/view_model/news_bloc/news_bloc.dart';
import 'package:nti_hub_app/features/on_boarding/data/datasources/onboarding_local_datasource.dart';
import 'package:nti_hub_app/features/on_boarding/data/datasources/onboarding_local_datasource_imp.dart';
import 'package:nti_hub_app/features/on_boarding/data/repositories/onboarding_local_repo.dart';
import 'package:nti_hub_app/features/on_boarding/data/repositories/onboarding_local_repo_imp.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/view_model/onboarding_bloc/onboarding_bloc.dart';
import 'package:nti_hub_app/features/splash/presentation/view_models/splash_bloc/splash_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // SharedPrefs
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  // Firebase
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseAuth.instance);

  //  Onboarding
  getIt.registerLazySingleton<OnboardingLocalDatasource>(
    () => OnboardingLocalDatasourceImp(prefs: getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<OnboardingLocalRepo>(
    () =>
        OnboardingLocalRepoImp(datasource: getIt<OnboardingLocalDatasource>()),
  );
  getIt.registerFactory(
    () => OnboardingBloc(
      repo: getIt<OnboardingLocalRepo>(),
      authRepo: getIt<AuthRepository>(),
    ),
  );

  //  Programs
  getIt.registerLazySingleton<ProgramsRemoteDatasource>(
    () => ProgramsRemoteDatasourceImp(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<ProgramRepository>(
    () => ProgramRepositoryImp(datasource: getIt<ProgramsRemoteDatasource>()),
  );
  getIt.registerFactory<ProgramsBloc>(
    () => ProgramsBloc(repo: getIt<ProgramRepository>()),
  );

  //  Hero Section
  getIt.registerLazySingleton<HeroRemoteDataSource>(
    () => HeroRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<HeroHomeRepository>(
    () => HeroSectionRepositoryImp(dataSource: getIt()),
  );
  getIt.registerFactory<HeroHomeBloc>(
    () => HeroHomeBloc(homerepo: getIt<HeroHomeRepository>()),
  );

  // News
  getIt.registerLazySingleton<NewRemoteDatasource>(
    () => NewRemoteDatasourceImp(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<NewRepository>(
    () => NewRepositoryImp(datasource: getIt<NewRemoteDatasource>()),
  );
  getIt.registerFactory<NewsBloc>(() => NewsBloc(repo: getIt<NewRepository>()));

  // Auth
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImp(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(datasource: getIt<AuthRemoteDatasource>()),
  );
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepository>()));

  getIt.registerFactory<SplashBloc>(() => SplashBloc(getIt<AuthRepository>()));
}
