part of 'carousel_bloc.dart';

@immutable
abstract class CarouselEvent {}

class SetImagesEvent extends CarouselEvent {
  final List<String> images;

  SetImagesEvent(this.images);
}

class PageChangedEvent extends CarouselEvent {
  final int index;

  PageChangedEvent(this.index);
}

class StartAutoSlideEvent extends CarouselEvent {}
