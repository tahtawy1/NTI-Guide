import 'package:flutter/material.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/program_model.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/bottom_sheet_icon.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/custom_close_button.dart';

class PartnersBottomSheet extends StatelessWidget {
  const PartnersBottomSheet({super.key, required this.program});

  final ProgramModel program;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetIcon(),
            Image.network(program.partners!.partnersImageUrl),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomCloseButton(),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
