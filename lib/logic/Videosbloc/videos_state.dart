part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();
}

class VideosInitial extends VideosState {
  @override
  List<Object?> get props => [];
}

class VideosAvailableState extends VideosState {
  final List<FileSystemEntity> videoList;
  const VideosAvailableState({
    required this.videoList,
  });
  @override
  List<Object?> get props => [videoList];
}

class VideosEmptyState extends VideosState {
  @override
  List<Object?> get props => [];
}

class VideosNullState extends VideosState {
  @override
  List<Object?> get props => [];
}
