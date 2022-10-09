import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  PermissionsBloc() : super(PermissionsInitial()) {
    on<PermissionstatusEvent>((event, emit) async {
      // final AndroidDeviceInfo androidSdkInfo =
      //     await DeviceInfoPlugin().androidInfo;
      // final int? androidSdk = androidSdkInfo.version.sdkInt;

      // if (androidSdk! >= 30) {
      //   PermissionStatus status = await Permission.manageExternalStorage.status;
      //   if (status.isGranted) {
      //     return emit(PermissionsGrantedState());
      //   } else {
      //     return emit(PermissionsInitial());
      //   }
      // } else {
      PermissionStatus permissionStatus = await Permission.storage.status;
      if (permissionStatus.isGranted) {
        emit(PermissionsGrantedState());
      } else {
        emit(PermissionsInitial());
        // }
      }
    });
    on<PermissionsRequestEvent>((event, emit) async {
      // final AndroidDeviceInfo androidSdkInfo =
      //     await DeviceInfoPlugin().androidInfo;
      // final int? androidSdk = androidSdkInfo.version.sdkInt;
      // if (androidSdk! >= 30) {
      //   PermissionStatus permissionStatus =
      //       await Permission.manageExternalStorage.request();
      //   if (permissionStatus.isGranted) {
      //     return emit(PermissionsGrantedState());
      //   }
      //   if (permissionStatus.isDenied) {
      //     return emit(PermissionsDenied());
      //   } else {
      //     return emit(PermissionsDeniedForever());
      //   }
      // } else {
      PermissionStatus permissionRequest = await Permission.storage.request();
      if (permissionRequest.isGranted) {
        return emit(PermissionsGrantedState());
      }
      if (permissionRequest.isDenied) {
        return emit(PermissionsDenied());
      } else {
        return emit(PermissionsDeniedForever());
        // }
      }
    });
  }
}

 //PermissionStatus permissionRequest = await Permission.m;