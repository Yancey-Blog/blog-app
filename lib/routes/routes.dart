import 'package:flutter/material.dart';
import 'package:blog_app/screens/screens.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomePage(),
    'device_info_page': (context) => DeviceInfoPage(),
    'battery_info_page': (context) => BatteryPage(),
    'post_detail_page': (context) => PostDetailPage(),
  };
}
