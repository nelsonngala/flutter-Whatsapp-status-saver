part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();
}

class ImagesInitialState extends ImagesState {
  @override
  List<Object?> get props => [];
}

class ImagesAvailableState extends ImagesState {
  final List<FileSystemEntity> imagesList;
  const ImagesAvailableState({
    required this.imagesList,
  });
  @override
  List<Object?> get props => [imagesList];
}

class ImagesEmptyState extends ImagesState {
  @override
  List<Object?> get props => [];
}

class ImagesNullState extends ImagesState {
  @override
  List<Object?> get props => [];
}
