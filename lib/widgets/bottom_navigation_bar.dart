import 'package:flutter/material.dart';
import '../screens/battery_info/battery_info.dart';
import '../screens/device_info/device_info.dart';
import './sliver_app_bar.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      _pushToBatteryPage();
    }

    if (index == 1) {
      _pushToDeviceInfoPage();
    }

    if (index == 2) {
      _pushToSliverPage();
    }
  }

  void _pushToBatteryPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return BatteryPage();
        },
      ),
    );
  }

  void _pushToDeviceInfoPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return DeviceInfoPage();
        },
      ),
    );
  }

  void _pushToSliverPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SliverPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.home),
        //   // ignore: deprecated_member_use
        //   title: Text('Home'),
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.battery_full),
          // ignore: deprecated_member_use
          title: Text('Battery'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.device_hub),
          // ignore: deprecated_member_use
          title: Text('Device'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          // ignore: deprecated_member_use
          title: Text('Sliver'),
        ),
      ],
      currentIndex: 2,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
