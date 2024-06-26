import 'package:bob_mobile/home/home_service.dart';
import 'package:bob_mobile/shared/remote_material_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rfw/formats.dart';
import 'package:rfw/rfw.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Runtime _runtime = Runtime();
  final DynamicContent _data = DynamicContent();

  static const LibraryName coreName = LibraryName(<String>['core', 'widgets']);
  static const LibraryName coreMaterial =
      LibraryName(<String>['core', 'material']);
  static const LibraryName mainName = LibraryName(<String>['main']);

  @override
  void initState() {
    super.initState();
    // Local widget library:
    _runtime.update(coreName, createCoreWidgets());

    _runtime.update(coreMaterial, createRemoteMaterialWidgets());

    _runtime.update(
        mainName,
        parseLibraryFile(
            '''import core.widgets; import core.material; widget root = Scaffold(body: Center(child: CircularProgressIndicator()));'''));

    Future.delayed(const Duration(seconds: 1)).then((value) {
      HomeService(dio: Dio()).getCourses().then((value) {
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
            Modular.to.navigate('/');
          }
          // The example above does not have any way to trigger events, but if it
          // did, they would result in this callback being invoked.
          debugPrint('user triggered event "$name" with data: $arguments');
        },
      ),
    );
  }
}
