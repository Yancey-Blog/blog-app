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
  };

  static final initialRoute = 'music_screen';
}
