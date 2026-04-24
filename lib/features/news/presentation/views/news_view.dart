import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_back_button.dart';
import 'package:nti_hub_app/features/news/presentation/view_model/news_bloc/news_bloc.dart';
import 'package:nti_hub_app/features/news/presentation/views/widgets/add_new_bottom_modal_sheet.dart';
import 'package:nti_hub_app/features/news/presentation/views/widgets/news_list_item.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          AppStrings.newsScreenTitle,
          style: AppTextStyles.textLgBold.copyWith(
            color: AppColors.darkPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading || state is NewsInitial) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 6,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (_, _) => _NewsItemSkeleton(),
            );
          }

          if (state is NewsError) {
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
                      state.message,
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

          if (state is NewsLoaded) {
            if (state.news.isEmpty) {
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
              itemCount: state.news.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (_, index) {
                final item = state.news[index];
                return NewsListItem(
                  news: item,
                  onTap: () =>
                      context.push(AppStrings.newsDetailsRoute, extra: item),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),

      floatingActionButton: AddNewButton(bloc: context.read<NewsBloc>()),
    );
  }
}

class AddNewButton extends StatelessWidget {
  const AddNewButton({super.key, required this.bloc});

  final NewsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (_) => BlocProvider<NewsBloc>.value(
            value: bloc,
            child: const AddNewBottomModalSheet(),
          ),
        );
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          color: AppColors.darkPrimary,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: AppColors.shadowColor, blurRadius: 5)],
        ),
        child: const Icon(Icons.add, color: AppColors.onPrimary, size: 24),
      ),
    );
  }
}

class _NewsItemSkeleton extends StatelessWidget {
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
