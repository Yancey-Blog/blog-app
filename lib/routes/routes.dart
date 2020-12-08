import 'package:flutter/material.dart';
import 'package:blog_app/blocs/post_list_bloc/post_list_repository.dart';
import 'package:blog_app/blocs/post_detail_bloc/post_detail_repository.dart';
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
  };
}
