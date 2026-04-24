import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/core/services/service_locator.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/view_model/bloc/programs_bloc.dart';
import 'package:nti_hub_app/features/capacity_building/presentation/views/widgets/program_list_item.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_back_button.dart';
import 'package:nti_hub_app/features/news/presentation/view_model/news_bloc/news_bloc.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key, required this.programs});
  final List<ProgramModel> programs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.capacityBuildingTitle,
          style: AppTextStyles.textLgBold.copyWith(
            color: AppColors.darkPrimary,
          ),
        ),
        centerTitle: true,
        leading: const CustomBackButton(),
      ),
      body: BlocProvider<ProgramsBloc>(
        create: (context) => getIt<ProgramsBloc>()..add(LoadProgramsEvent()),
        child: BlocBuilder<ProgramsBloc, ProgramsState>(
          builder: (context, state) {
            if (state is LoadingPrograms || state is ProgramsInitial) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: 6,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, _) => _ProgramItemSkeleton(),
              );
            }

            if (state is LoadProgramsError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.cloud_off_outlined,
                        size: 64,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Something went wrong',
                        style: AppTextStyles.textLgBold.copyWith(
                          color: AppColors.darkPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.errMessage,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.text14Regular.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () =>
                            context.read<NewsBloc>().add(LoadNewsEvent()),
                        icon: const Icon(Icons.refresh),
                        label: const Text(AppStrings.newsErrorRetry),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is ProgramsLoaded) {
              if (state.programs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.newspaper_outlined,
                        size: 64,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppStrings.noNewsAvailable,
                        style: AppTextStyles.textMdSemiBold.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.programs.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final item = state.programs[index];
                  return ProgramListItem(
                    program: item,
                    onTap: () => context.push(
                      AppStrings.programDetailsRoute,
                      extra: item,
                    ),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _ProgramItemSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 6)],
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(20),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SkeletonLine(width: 80, height: 10),
                  SizedBox(height: 8),
                  _SkeletonLine(width: double.infinity, height: 10),
                  SizedBox(height: 6),
                  _SkeletonLine(width: double.infinity, height: 10),
                  SizedBox(height: 6),
                  _SkeletonLine(width: 140, height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(15),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
