import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whatsapp_status_saver/logic/Imagesbloc/images_bloc.dart';
import 'package:whatsapp_status_saver/logic/Videosbloc/videos_bloc.dart';
import 'package:whatsapp_status_saver/presentation/widgets/tabBarViews/video_tab.dart';

import '../../logic/Themebloc/theme_bloc.dart';
import '../widgets/tabBarViews/image_tab.dart';
import '../widgets/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).backgroundColor,
              leading: IconButton(
                  icon: Icon(state.theme == AppTheme.darkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeToggledEvent());
                  }),
              title: const Text('Status Saver'),
              bottom: const TabBar(tabs: [
                Tab(
                  text: 'Images',
                ),
                Tab(
                  text: 'Videos',
                ),
              ]),
            ),
            body: TabBarView(children: [
              Column(
                children: [
                  BlocBuilder<ImagesBloc, ImagesState>(
                      builder: ((context, state) {
                    if (state is ImagesAvailableState) {
                      return Expanded(
                          child: ImagesTab(imagesList: state.imagesList));
                    }

                    if (state is ImagesEmptyState) {
                      return const Center(
                        child: Text('No status viewed yet'),
                      );
                    }
                    if (state is ImagesNullState) {
                      return const Center(
                        child: Text(
                            'Looks like whatsapp is not installed in your device.'),
                      );
                    }
                    return Container();
                  })),
                ],
              ),
              BlocBuilder<VideosBloc, VideosState>(builder: ((context, state) {
                if (state is VideosAvailableState) {
                  return VideoTab(videoList: state.videoList);
                }
                if (state is VideosEmptyState) {
                  return const Center(
                    child: Text('No whatsapp video status viewed'),
                  );
                }
                if (state is VideosNullState) {
                  return const Center(
                    child: Text(
                        'Looks like whatsapp is not installed in your device.'),
                  );
                }
                return Container();
              }))
            ]),
          );
        },
      ),
    );
  }
}
