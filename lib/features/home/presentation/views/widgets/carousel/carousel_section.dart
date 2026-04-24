import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_hub_app/core/constants/app_assets.dart';
import 'package:nti_hub_app/features/home/presentation/view_model/carousel_bloc/carousel_bloc.dart';
import 'package:nti_hub_app/features/home/presentation/views/widgets/carousel/carousel_indicator.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CarouselBloc>(context).add(
      SetImagesEvent(const [
        AppAssets.ntiImg,
        AppAssets.capacityBuildingImg,
        AppAssets.creativaImg,
        AppAssets.researchAndDiplomaImg,
        AppAssets.graduateDiplomaImg,
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselBloc, CarouselState>(
      builder: (context, state) {
        final bloc = context.read<CarouselBloc>();

        if (state.images.isEmpty) {
          return const SizedBox();
        }

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.25,
              child: PageView.builder(
                controller: bloc.controller,

                onPageChanged: (index) {
                  bloc.add(PageChangedEvent(index));
                },

                itemCount: state.images.length,
                itemBuilder: (context, index) {
                  return Image.asset(state.images[index], fit: BoxFit.fill);
                },
              ),
            ),

            Positioned(
              bottom: 8,
              child: CarouselIndicator(
                length: state.images.length,
                currentPage: state.currentPage,
              ),
            ),
          ],
        );
      },
    );
  }
}
