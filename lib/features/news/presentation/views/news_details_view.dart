import 'package:flutter/material.dart';
import 'package:nti_hub_app/core/constants/app_colors.dart';
import 'package:nti_hub_app/core/constants/app_text_styles.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_back_button.dart';
import 'package:nti_hub_app/features/news/data/models/new_model.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.currentNew});

  final NewModel currentNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Details',
          style: AppTextStyles.textLgExtraBold.copyWith(
            color: AppColors.darkPrimary,
          ),
        ),
        centerTitle: true,
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              Text(
                currentNew.brief,
                style: AppTextStyles.textLgBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Date: ${currentNew.formattedDate}',
                style: AppTextStyles.text14Regular.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                currentNew.description,
                style: AppTextStyles.textLgRegular.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 28),
              ...currentNew.imagesUrl.map(
                (url) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Image.network(url),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
