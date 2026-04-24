part of 'carousel_bloc.dart';

class CarouselState {
  final int currentPage;
  final List<String> images;

  const CarouselState({required this.currentPage, required this.images});

  CarouselState copyWith({int? currentPage, List<String>? images}) {
    return CarouselState(
      currentPage: currentPage ?? this.currentPage,
      images: images ?? this.images,
    );
  }
}
