import 'package:posthog_flutter/posthog_flutter.dart';

final class AnalyticsModule {
  static Future<void> initialize(String apiKey) async {
    await Posthog().setup(PostHogConfig(apiKey));
  }

  static Future<void> sendScreenEvent(String screenName) async {
    await Posthog().screen(screenName: screenName);
  }

  static Future<void> sendEvent(
    String eventName, [
    Map<String, Object>? properties,
  ]) async {
    await Posthog().capture(eventName: eventName, properties: properties);
  }
}
