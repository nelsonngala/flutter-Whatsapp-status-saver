import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_status_saver/data/status_data.dart';
import 'package:whatsapp_status_saver/logic/PermissionBloc/permissions_bloc.dart';
import 'package:whatsapp_status_saver/logic/Themebloc/theme_bloc.dart';
import 'package:whatsapp_status_saver/logic/Videosbloc/videos_bloc.dart';
import 'package:whatsapp_status_saver/presentation/screens/landing_screen.dart';
import 'package:whatsapp_status_saver/presentation/widgets/theme/theme.dart';

import 'logic/Imagesbloc/images_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PermissionsBloc()
            ..add(PermissionstatusEvent())
            ..add(PermissionsRequestEvent()),
        ),
        BlocProvider(
          create: (context) =>
              ImagesBloc(ImagesData())..add(const ImagesEvent()),
        ),
        BlocProvider(
            create: ((context) =>
                VideosBloc(VideoData())..add(const VideosEvent()))),
        BlocProvider(create: ((context) => ThemeBloc()))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Status Saver',
            debugShowCheckedModeBanner: false,
            theme: appThemeData[state.theme],
            home: const LandingScreen(),
          );
        },
      ),
    );
  }
}
