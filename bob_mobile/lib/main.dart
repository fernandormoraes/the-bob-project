import 'package:bob_mobile/app_module.dart';
import 'package:bob_mobile/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_app/analytics/analytics_module.dart';

void main() async {
  await dotenv.load();
  final apiKey = dotenv.env['POSTHOG_KEY'] ?? '';
  await AnalyticsModule.initialize(apiKey);

  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
