import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:whatsapp_status_saver/presentation/screens/video_play.dart';

Future<String> getThumbnail(String path) async {
  String? thumb = await VideoThumbnail.thumbnailFile(video: path);

  return thumb!;
}

class VideoTab extends StatelessWidget {
  final List<FileSystemEntity> videoList;
  const VideoTab({
    Key? key,
    required this.videoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemCount: videoList.length,
          itemBuilder: ((context, index) {
            final video = videoList[index];
            return FutureBuilder(
                future: getThumbnail(video.path),
                builder: ((context, snapshot) {
                  return snapshot.hasData
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) =>
                                    VideoPlayScreen(videoPath: video.path))));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(File(snapshot.data!)))),
                          ),
                        )
                      : const SizedBox();
                }));
          })),
    );
  }
}
