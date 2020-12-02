import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class BatteryScreen extends StatefulWidget {
  BatteryScreen({Key key}) : super(key: key);

  @override
  _BatteryScreenState createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  final _battery = Battery();
  StreamSubscription<BatteryState> _batteryStateSubscription;

  BatteryState _batteryState;

  @override
  void initState() {
    super.initState();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      print(state);
      setState(() {
        _batteryState = state;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔋 status'),
      ),
      body: Center(
        child: Text('$_batteryState'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.battery_unknown),
        onPressed: () async {
          final batteryLevel = await _battery.batteryLevel;
          await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Text('Battery: $batteryLevel%'),
              actions: <Widget>[
                FlatButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
