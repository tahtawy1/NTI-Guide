import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_strings.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/auth/presentation/view_models/blocs/auth_bloc.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/data/models/item_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/drawer/custom_drawer_button.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/drawer/custom_section_title.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';

class CustomDrawer extends StatelessWidget {
  final List<ProgramModel> programs;
  final List<NewModel> news;

  const CustomDrawer({super.key, required this.programs, required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, right: 18, left: 18),
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.12),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppAssets.bigLogo),
                const SizedBox(height: 24),

                // ================= MAIN =================
                const CustomSectionTitle(title: AppStrings.mainSectionTitle),
                const SizedBox(height: 8),

                CustomDrawerButton(
                  item: ItemModel(
                    title: AppStrings.capacityBuildingTitle,
                    icon: Icons.school_outlined,
                    routePath: AppStrings.programsViewRoute,
                  ),
                  onTap: () => context.push(
                    AppStrings.programsViewRoute,
                    extra: programs,
                  ),
                ),

                const SizedBox(height: 4),

                CustomDrawerButton(
                  item: ItemModel(
                    title: AppStrings.newsTitle,
                    icon: Icons.newspaper,
                    routePath: AppStrings.newsRoute,
                  ),
                  onTap: () => context.push(AppStrings.newsRoute, extra: news),
                ),

                const SizedBox(height: 24),

                // ================= NTI =================
                const CustomSectionTitle(
                  title: AppStrings.ntiInLinesSectionTitle,
                ),
                const SizedBox(height: 8),

                CustomDrawerButton(
                  item: ItemModel(
                    title: AppStrings.aboutTitle,
                    icon: Icons.info_outline,
                    routePath: AppStrings.aboutNtiRoute,
                  ),
                  onTap: () => context.push(AppStrings.aboutNtiRoute),
                ),

                //
                const SizedBox(height: 24),

                // ================= OTHER =================
                const CustomSectionTitle(title: AppStrings.otherSectionTitle),
                const SizedBox(height: 8),
                const LogOutButton(),

                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: TextButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
          context.go(AppStrings.signInRoute);
        },
        child: Row(
          children: [
            const Icon(Icons.login, color: AppColors.darkRed, size: 18),
            const SizedBox(width: 10),
            Flexible(
              child: FittedBox(
                child: Text(
                  AppStrings.logOut,
                  style: AppTextStyles.textMdSemiBold.copyWith(
                    color: AppColors.darkRed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
