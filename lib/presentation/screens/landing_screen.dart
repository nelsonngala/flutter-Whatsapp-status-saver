import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_status_saver/logic/PermissionBloc/permissions_bloc.dart';
import 'package:whatsapp_status_saver/presentation/screens/home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PermissionsBloc, PermissionsState>(
            builder: ((context, state) {
          if (state is PermissionsDenied) {
            return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PermissionsBloc>(context)
                      .add(PermissionsRequestEvent());
                },
                child:
                    const Text('Please, allow access to storage permission.'));
          }
          if (state is PermissionsGrantedState) {
            return const HomeScreen();
          }
          if (state is PermissionsDeniedForever) {
            return ElevatedButton(
                onPressed: () {
                  openAppSettings().then((value) =>
                      BlocProvider.of<PermissionsBloc>(context)
                          .add(PermissionstatusEvent()));
                },
                child: const Text(
                    'Open settings page and allow the app permission to storage.'));
          }
          return Container();
        })),
      ),
    );
  }
}
