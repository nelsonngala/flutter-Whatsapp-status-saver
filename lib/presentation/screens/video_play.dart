import 'dart:io';

import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_extend/share_extend.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  final String videoPath;
  const VideoPlayScreen({
    Key? key,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  SnackBar snackBar = const SnackBar(content: Text('Saved to gallery'));
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.file(File(widget.videoPath)),
      allowMuting: true,
      autoPlay: true,
      autoInitialize: true,
      showControlsOnInitialize: true,
      allowFullScreen: true,
    );
  }

  @override
  void dispose() {
    _chewieController!.pause();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Chewie(controller: _chewieController!),
      floatingActionButton:
          RadialMenu(centerButtonAlignment: Alignment.bottomCenter, children: [
        RadialButton(
          icon: const Icon(
            Icons.download,
            color: Colors.blue,
          ),
          onPress: () async {
            await ImageGallerySaver.saveFile(widget.videoPath).then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(snackBar));
          },
        ),
        RadialButton(
            icon: const Icon(Icons.share),
            onPress: () async {
              ShareExtend.share(widget.videoPath, 'video');
            })
      ]),
    );
  }
}
