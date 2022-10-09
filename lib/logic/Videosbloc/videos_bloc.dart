import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whatsapp_status_saver/data/status_data.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final VideoData _videoData;
  VideosBloc(
    this._videoData,
  ) : super(VideosInitial()) {
    on<VideosEvent>((event, emit) async {
      try {
        List<FileSystemEntity> videoList = await _videoData.getStatusVideos();
        if (videoList.isEmpty) {
          emit(VideosEmptyState());
        }
        emit(VideosAvailableState(videoList: videoList));
      } catch (e) {
        emit(VideosNullState());
      }
    });
  }
}
