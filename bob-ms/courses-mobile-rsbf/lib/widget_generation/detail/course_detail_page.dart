import 'package:bob_design_system/bob_design_system.dart';
import 'package:courses_mobile_rsbf/courses_model.dart';

final class CourseDetailPage {
  final CourseByIdResponseModel model;

  CourseDetailPage({required this.model});

  String generate() {
    final username = model.userName ?? 'User';

    final modules = model.data?.module
            ?.map((module) => '''
              Column(
                mainAxisAlignment: "start",
                crossAxisAlignment: "start",              
                children: [
                  ${DSPadding.opt(
                  start: Paddings.small,
                  top: Paddings.small,
                ).toSdui(DSText.header(text: module.description ?? '').toSdui())},
                  SingleChildScrollView(
                    scrollDirection: "horizontal",
                    child: Row(
                      mainAxisAlignment: "start",
                      crossAxisAlignment: "start",                                  
                      children: [
                        ${module.content?.map((element) => '''
                          ${DSPadding.opt(top: Paddings.small).toSdui(DSCardCover(
                      description: element.title ?? '',
                      coverUrl: element.cover ?? '',
                      videoUrl: element.video ?? '',
                      onLongPress:
                          "event 'card_cover.onLongPress' { arguments: [] }",
                      onTap:
                          "event 'card_cover.onTap' { arguments: {'videoUrl': '${element.video ?? ''}'} }",
                    ).toSdui())}
                        ''').join(',') ?? ''}
                      ],
                    ),
                  ),
                ],
              )
            ''')
            .toList() ??
        [];

    final modulesWidgets = '''
        Column(
          mainAxisAlignment: "start",
          crossAxisAlignment: "start",
          children: [
            ${modules.join(',')}
          ],
        )
    ''';

    return '''import core.widgets;
import core.material;

widget root = ${DSScaffold(appBarTitle: "Course Detail", username: username, isPrimaryPage: false, body: '''
SingleChildScrollView(
child: Column(
    mainAxisAlignment: "start",
    crossAxisAlignment: "start",    
    children: [
        ${DSPadding.startLarge().toSdui(DSText.title(text: model.data?.description ?? 'Course Detail').toSdui())},
        ${DSPadding.startLarge().toSdui(DSText.normal(text: model.data?.description ?? '').toSdui())},
        SizedBox(height: ${Paddings.medium}),
        Align( 
          alignment: "start",
          child: $modulesWidgets,
        )
    ]))
    ''').toSdui()} 
''';
  }
}
