import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_app/home_service.dart';
import 'package:rfw/formats.dart';
import 'package:rfw/rfw.dart';
import 'package:shared_app/analytics/analytics_module.dart';
import 'package:shared_app/remote_material_widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  final HomeService homeService = Modular.get<HomeService>();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Runtime _runtime = Runtime();
  final DynamicContent _data = DynamicContent();

  static const LibraryName coreName = LibraryName(<String>['core', 'widgets']);
  static const LibraryName coreMaterial = LibraryName(<String>[
    'core',
    'material',
  ]);
  static const LibraryName mainName = LibraryName(<String>['main']);

  @override
  void initState() {
    super.initState();
    _runtime.update(coreName, createCoreWidgets());

    _runtime.update(coreMaterial, createRemoteMaterialWidgets());

    _runtime.update(
      mainName,
      parseLibraryFile(
        '''import core.widgets; import core.material; widget root = Scaffold(body: Center(child: CircularProgressIndicator()));''',
      ),
    );

    Future.delayed(const Duration(seconds: 1)).then((value) {
      widget.homeService.getCourses().then((value) {
        debugPrint(value);

        _runtime.update(mainName, parseLibraryFile(value));

        _data.update('greet', <String, Object>{'name': 'World'});
      });
    });

    // Remote widget library:
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoteWidget(
        runtime: _runtime,
        data: _data,
        widget: const FullyQualifiedWidgetName(mainName, 'root'),
        onEvent: (String name, DynamicMap arguments) {
          if (name == 'drawer.logout') {
            AnalyticsModule.sendEvent('logout');
            Modular.to.navigate('/');
          }
          if (name == 'card_cover.play_video') {
            final args = arguments['arguments'];

            if (args is! Map) {
              return;
            }

            final videoUrl = args['videoUrl'] as String? ?? '';

            if (videoUrl.isNotEmpty) {
              AnalyticsModule.sendEvent('play_video', <String, Object>{
                'video_url': videoUrl,
              });

              final videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? '';

              if (videoId.isEmpty) {
                return;
              }

              final controller = YoutubePlayerController(
                initialVideoId: videoId,
                flags: const YoutubePlayerFlags(autoPlay: true),
              );

              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.6,
                    minChildSize: 0.35,
                    maxChildSize: 0.95,
                    builder:
                        (
                          BuildContext context,
                          ScrollController scrollController,
                        ) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(height: 12),
                                Container(
                                  width: 40,
                                  height: 4,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                Expanded(
                                  child: YoutubePlayer(controller: controller),
                                ),
                              ],
                            ),
                          );
                        },
                  );
                },
              ).then((value) {
                controller.pause();
                Future.delayed(
                  const Duration(seconds: 1),
                ).then((_) => controller.dispose());
              });
            }
          }
          // The example above does not have any way to trigger events, but if it
          // did, they would result in this callback being invoked.
          debugPrint('user triggered event "$name" with data: $arguments');
        },
      ),
    );
  }
}
