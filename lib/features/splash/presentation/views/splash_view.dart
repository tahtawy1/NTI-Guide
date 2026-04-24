import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/services/set_system_ui.dart';
import 'package:nti_hub_app/features/splash/presentation/view_models/splash_bloc/splash_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import 'widgets/nti_logo_widget.dart';
import 'widgets/splash_loading_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _loadingController;
  late final Animation<double> _logoFade;
  late final Animation<double> _loadingFade;

  @override
  void initState() {
    super.initState();
    SystemUiService.setSystemUI();
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _logoFade = CurvedAnimation(parent: _logoController, curve: Curves.easeIn);
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _loadingFade = CurvedAnimation(
      parent: _loadingController,
      curve: Curves.easeIn,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(StartSplash());
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.surfacePrimary,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLogoState) {
            _logoController.forward(from: 0);
          }

          if (state is SplashLoadingState) {
            _loadingController.forward(from: 0);
          }

          if (state is NavigateToOnboarding) {
            context.go(AppStrings.onboardingRoute);
          }
          if (state is NavigateToHome) {
            context.go(AppStrings.homeRoute);
          }
          if (state is NavigateToAuth) {
            context.go(AppStrings.signInRoute);
          }
        },
        child: Stack(
          children: [
            Center(
              child: FadeTransition(
                opacity: _logoFade,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: NtiLogoWidget(),
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: screenHeight * 0.08,
              child: FadeTransition(
                opacity: _loadingFade,
                child: const SplashLoadingWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
