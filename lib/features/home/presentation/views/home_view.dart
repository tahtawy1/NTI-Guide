import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/view_model/hero_section_bloc/hero_home_bloc.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/card_skeleton.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/cards_page_view.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/carousel/carousel_section.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/drawer/custom_drawer.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/news_section.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';
import 'package:nti_hub_app/features/news/presentation/view_model/news_bloc/news_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProgramModel> programs = [];
  List<NewModel> news = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomAppBar()),
      body: SafeArea(
        child: ListView(
          children: [
            const CarouselSection(),
            Column(
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    AppStrings.appFullName,
                    style: AppTextStyles.textXlExtraBoldTight.copyWith(
                      color: AppColors.darkPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    AppStrings.ntiBrief,
                    style: AppTextStyles.textMdSemiBold.copyWith(
                      color: AppColors.textPrimaryVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                //  Programs Section
                BlocBuilder<HeroHomeBloc, HeroHomeState>(
                  builder: (context, state) {
                    if (state is HeroProgramsLoaded) {
                      if (state.programs.isEmpty) {
                        return const Center(
                          child: Text('No programs available'),
                        );
                      }
                      programs = state.programs;
                      return CardsPageView(programs: state.programs);
                    }
                    if (state is HeroLoadProgramsFailure) {
                      return const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    }
                    return const CardSkeleton();
                  },
                ),

                const SizedBox(height: 42),

                //  Latest News Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilder<NewsBloc, NewsState>(
                    builder: (context, state) {
                      if (state is NewsLoaded) {
                        if (state.news.isEmpty) {
                          return const Text('No News available');
                        }
                        news = state.news;
                        return NewsSection(news: state.news);
                      }
                      if (state is NewsError) {
                        return Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: AppColors.darkRed,
                                size: 36,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.text14Regular.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const CardSkeleton();
                    },
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(programs: programs, news: news),
    );
  }
}
