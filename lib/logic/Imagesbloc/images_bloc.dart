import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whatsapp_status_saver/data/status_data.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final ImagesData imagesData;

  ImagesBloc(
    this.imagesData,
  ) : super(ImagesInitialState()) {
    on<ImagesEvent>((event, emit) async {
      try {
        List<FileSystemEntity> imgList = await imagesData.getStatusImages();
        if (imgList.isEmpty) {
          emit(ImagesEmptyState());
        }
        emit(ImagesAvailableState(imagesList: imgList));
      } catch (e) {
        emit(ImagesNullState());
      }
    });
  }
}
