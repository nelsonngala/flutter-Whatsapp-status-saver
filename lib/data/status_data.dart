import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';

class ImagesData {
  //get root directories of internal storage and external storage if avaialble
  Future<List<FileSystemEntity>> getStatusImages() async {
    final AndroidDeviceInfo androidSdkInfo =
        await DeviceInfoPlugin().androidInfo;
    final int? androidSdk = androidSdkInfo.version.sdkInt;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    List<String> paths = await ExternalPath.getExternalStorageDirectories();
    //path to root directory of internal storage
    String intPath = paths[0];
    //path to root directory of external storage
    String extPath = paths[1];
    late Directory directory;

    //in android 9 and below
    if (androidSdk! <= 28) {
      directory = Directory('$extPath/Whatsapp/Media/.Statuses');
      //if sdcard does not exist
      if (!directory.existsSync()) {
        directory = Directory('$intPath/Whatsapp/Media/.Statuses');
      }
    } else {
      //in adroid 10 and above
      directory = Directory(
          "$intPath/Android/media/com.whatsapp/WhatsApp/Media/.Statuses");
      if (!directory.existsSync()) {
        directory = Directory('$intPath/Whatsapp/Media/.Statuses');
      }
    }

    List<FileSystemEntity> imagesList =
        directory.listSync().where((e) => e.path.endsWith('.jpg')).toList();

    return imagesList;
  }
}

class VideoData {
  //get root directories of internal storage and external storage if avaialble
  Future<List<FileSystemEntity>> getStatusVideos() async {
    final AndroidDeviceInfo androidSdkInfo =
        await DeviceInfoPlugin().androidInfo;
    final int? androidSdk = androidSdkInfo.version.sdkInt;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    List<String> paths = await ExternalPath.getExternalStorageDirectories();
    //path to root directory of internal storage
    String intPath = paths[0];
    //path to root directory of external storage
    String extPath = paths[1];
    late Directory directory;

    //in android 9 and below
    if (androidSdk! <= 28) {
      directory = Directory('$extPath/Whatsapp/Media/.Statuses');
      //if sdcard does not exist
      if (!directory.existsSync()) {
        directory = Directory('$intPath/Whatsapp/Media/.Statuses');
      }
    } else {
      //in android 10 and above
      directory = Directory(
          "$intPath/Android/media/com.whatsapp/WhatsApp/Media/.Statuses");
      if (!directory.existsSync()) {
        directory = Directory('$intPath/Whatsapp/Media/.Statuses');
      }
    }

    List<FileSystemEntity> videoList =
        directory.listSync().where((e) => e.path.endsWith('.mp4')).toList();

    return videoList;
  }
}
