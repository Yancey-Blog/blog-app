import 'package:flutter/material.dart';
import 'package:blog_app/blocs/post_bloc/repository.dart';
import 'package:blog_app/screens/screens.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    'device_info_screen': (context) => DeviceInfoScreen(),
    'battery_info_screen': (context) => BatteryScreen(),
    'post_detail_screen': (context) => PostDetailScreen(),
    'post_list_screen': (context) => PostListScreen(
          postRepository: PostRepository(),
        ),
  };
}
