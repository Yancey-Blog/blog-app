import 'package:flutter/material.dart';
import '../screens/settings/settings.dart';
import '../screens/info/info.dart';

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

    if (index == 1) {
      _pushToSettingPage();
    }

    if (index == 2) {
      _pushToInfoPage();
    }
  }

  void _pushToSettingPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SettingPage();
        },
      ),
    );
  }

  void _pushToInfoPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return InfoPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          // ignore: deprecated_member_use
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.battery_full),
          // ignore: deprecated_member_use
          title: Text('Battery'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          // ignore: deprecated_member_use
          title: Text('Settings'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
