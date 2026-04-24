import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/services/service_locator.dart';
import 'package:nti_hub_app/features/auth/presentation/view_models/blocs/auth_bloc.dart';
import 'package:nti_hub_app/features/auth/presentation/views/reset_password/views/reset_password_view.dart';
import 'package:nti_hub_app/features/auth/presentation/views/signIn/views/sign_in_view.dart';
import 'package:nti_hub_app/features/auth/presentation/views/signUp/views/sign_up_view.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/programs_view.dart';
import 'package:nti_hub_app/features/home/presentation/view_model/carousel_bloc/carousel_bloc.dart';
import 'package:nti_hub_app/features/home/presentation/view_model/hero_section_bloc/hero_home_bloc.dart';
import 'package:nti_hub_app/features/home/presentation/views/home_view.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/program_details_view.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';
import 'package:nti_hub_app/features/news/presentation/view_model/news_bloc/news_bloc.dart';
import 'package:nti_hub_app/features/news/presentation/views/news_details_view.dart';
import 'package:nti_hub_app/features/news/presentation/views/news_view.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/view_model/onboarding_bloc/onboarding_bloc.dart';
import 'package:nti_hub_app/features/on_boarding/presentation/views/onboarding_view.dart';
import 'package:nti_hub_app/features/splash/presentation/view_models/splash_bloc/splash_bloc.dart';
import 'package:nti_hub_app/features/splash/presentation/views/splash_view.dart';
import 'package:nti_hub_app/features/about_nti/presentation/views/about_nti_view.dart';
import '../constants/app_strings.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppStrings.splashRoute,
  debugLogDiagnostics: false,
  routes: [
    //*  Splash
    GoRoute(
      path: AppStrings.splashRoute,
      name: 'splash',
      builder: (context, state) => BlocProvider<SplashBloc>(
        create: (_) => getIt<SplashBloc>(),
        child: const SplashView(),
      ),
    ),

    //*  Onboarding
    GoRoute(
      path: AppStrings.onboardingRoute,
      name: 'onboarding',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<OnboardingBloc>(),
        child: const OnboardingView(),
      ),
    ),

    //*  Auth
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(create: (_) => getIt<AuthBloc>(), child: child);
      },
      routes: [
        GoRoute(
          path: AppStrings.signInRoute,
          builder: (_, _) => const SignInView(),
        ),
        GoRoute(path: AppStrings.signUp, builder: (_, _) => const SignUpView()),

        GoRoute(
          path: AppStrings.resetPasswordRoute,
          builder: (_, _) => const ResetPasswordView(),
        ),
      ],
    ),

    //*  Home
    GoRoute(
      path: AppStrings.homeRoute,
      name: 'home',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<HeroHomeBloc>()..add(LoadProgramHeroEvent()),
          ),
          BlocProvider(create: (_) => getIt<AuthBloc>()),
          BlocProvider<CarouselBloc>(create: (_) => CarouselBloc()),
          BlocProvider<NewsBloc>(
            create: (_) => getIt<NewsBloc>()..add(LoadNewsEvent()),
          ),
        ],
        child: const HomeView(),
      ),
    ),

    //* news view
    GoRoute(
      path: AppStrings.newsRoute,
      name: 'news',
      builder: (context, state) => BlocProvider<NewsBloc>(
        create: (_) => getIt<NewsBloc>()..add(LoadNewsEvent()),
        child: const NewsView(),
      ),
    ),

    //*  New Details
    GoRoute(
      path: AppStrings.newsDetailsRoute,
      name: 'news-details',
      builder: (context, state) =>
          NewsDetailsView(currentNew: state.extra as NewModel),
    ),

    //*  Program Details
    GoRoute(
      path: AppStrings.programDetailsRoute,
      name: 'programs-details-view',
      builder: (context, state) =>
          ProgramDetailsView(program: state.extra as ProgramModel),
    ),

    //*  Programs List
    GoRoute(
      path: AppStrings.programsViewRoute,
      name: 'programs-view',
      builder: (context, state) =>
          ProgramsView(programs: state.extra as List<ProgramModel>),
    ),

    //*  About NTI
    GoRoute(
      path: AppStrings.aboutNtiRoute,
      name: 'about-nti',
      builder: (context, state) => const AboutNtiView(),
    ),
  ],
);
