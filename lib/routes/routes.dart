import 'package:flutter/material.dart';
import 'package:blog_app/repositories/repositories.dart';
import 'package:blog_app/screens/screens.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    'device_info_screen': (context) => DeviceInfoScreen(),
    'battery_info_screen': (context) => BatteryScreen(),
    'post_detail_screen': (context) => PostDetailScreen(
          postDetailRepository: PostDetailRepository(),
        ),
    'post_list_screen': (context) => PostListScreen(
          postListRepository: PostListRepository(),
        ),
    'music_screen': (context) => MusicScreen(
          musicRepository: MusicRepository(),
        ),
  };
}
