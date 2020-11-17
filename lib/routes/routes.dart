import 'package:flutter/foundation.dart';
import 'package:blog_app/screens/screens.dart';

class Routes {
  static final routes = {
    ValueKey('HomePage'): HomePage(),
    ValueKey('DeviceInfoPage'): DeviceInfoPage(),
    ValueKey('BatteryInfoPage'): BatteryPage(),
  };
}
