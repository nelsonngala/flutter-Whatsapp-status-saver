import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/presentation/screens/view_image.dart';

class ImagesTab extends StatelessWidget {
  final List<FileSystemEntity> imagesList;

  const ImagesTab({
    Key? key,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemCount: imagesList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = imagesList[index];
          return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => ViewImages(imgPath: image.path)))),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(
                          File(image.path),
                        ),
                        fit: BoxFit.cover)),
              ));
        },
      ),
    );
  }
}
