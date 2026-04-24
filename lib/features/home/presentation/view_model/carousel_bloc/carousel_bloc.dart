import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final PageController controller = PageController();
  Timer? _timer;

  CarouselBloc() : super(const CarouselState(currentPage: 0, images: [])) {
    on<SetImagesEvent>(_onSetImages);
    on<PageChangedEvent>(_onPageChanged);
    on<StartAutoSlideEvent>(_onStartAutoSlide);
  }

  void _onSetImages(SetImagesEvent event, Emitter<CarouselState> emit) {
    emit(state.copyWith(images: event.images, currentPage: 0));
    add(StartAutoSlideEvent());
  }

  void _onPageChanged(PageChangedEvent event, Emitter<CarouselState> emit) {
    emit(state.copyWith(currentPage: event.index));
  }

  void _onStartAutoSlide(
    StartAutoSlideEvent event,
    Emitter<CarouselState> emit,
  ) {
    _timer?.cancel();

    if (state.images.isEmpty) return;

    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      int nextPage;

      if (state.currentPage < state.images.length - 1) {
        nextPage = state.currentPage + 1;
      } else {
        nextPage = 0;
      }

      if (controller.hasClients) {
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }

      add(PageChangedEvent(nextPage));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    controller.dispose();
    return super.close();
  }
}
