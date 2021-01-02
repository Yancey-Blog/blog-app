import 'package:flutter/material.dart';
import 'package:blog_app/screens/screens.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => MainScreen(),
    '/home_screen': (context) => HomeScreen(),
    '/favorite_screen': (context) => FavoriteScreen(),
    '/me_screen': (context) => MeScreen(),
    'device_info_screen': (context) => DeviceInfoScreen(),
    'battery_info_screen': (context) => BatteryScreen(),
    'post_detail_screen': (context) => PostDetailScreen(),
    'post_list_screen': (context) => PostListScreen(),
    'music_screen': (context) => MusicScreen(),
    'player_detail_screen': (context) => PlayerDetailScreen(),
    'firebase_crashlytics_screen': (context) => FirebaseCrashlyticsScreen(),
    'firebase_analytics_screen': (context) => FirebaseAnalyticsScreen(),
    'firebase_messaging_screen': (context) => FirebaseMessagingScreen(),
    'setting_screen': (context) => SettingScreen(),
    'entrance_screen': (context) => EntranceScreen(),
    'login_screen': (context) => LoginScreen(),
  };

  static final initialRoute = '/';
}
