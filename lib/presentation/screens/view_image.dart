import 'dart:io';

import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_extend/share_extend.dart';

class ViewImages extends StatelessWidget {
  final String imgPath;
  const ViewImages({
    Key? key,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Image.file(File(imgPath)),
        ),
        floatingActionButton:
            RadialMenu(centerButtonAlignment: Alignment.bottomRight, children: [
          RadialButton(
            icon: const Icon(
              Icons.download,
              color: Colors.blue,
            ),
            onPress: () async {
              await ImageGallerySaver.saveFile(imgPath).then((value) =>
                  ScaffoldMessenger.of(context).showSnackBar(snackBar));
            },
          ),
          RadialButton(
              icon: const Icon(Icons.share),
              onPress: () async {
                ShareExtend.share(imgPath, 'image');
              })
        ]));
  }
}

const snackBar = SnackBar(content: Text('Saved to gallery'));

// void saveImage(BuildContext context) async {
//      await ImageGallerySaver.saveFile(imgPath).then((value) =>
//                   ScaffoldMessenger.of( context).showSnackBar(snackBar));
// }