import 'package:flutter/material.dart';
import 'package:blog_app/screens/screens.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    'device_info_screen': (context) => DeviceInfoScreen(),
    'battery_info_screen': (context) => BatteryScreen(),
    'post_detail_screen': (context) => PostDetailScreen(),
    'post_list_screen': (context) => PostListScreen(),
    'music_screen': (context) => MusicScreen(),
    'firebase_crashlytics_screen': (context) => FirebaseCrashlyticsScreen(),
    'firebase_analytics_screen': (context) => FirebaseAnalyticsScreen(),
    'firebase_messaging_screen': (context) => FirebaseMessagingScreen(),
  };

  static final initialRoute = 'post_list_screen';
}
