import 'package:flutter/material.dart';

class MeView extends StatefulWidget {
  MeView({Key key}) : super(key: key);

  @override
  _MeViewState createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('me'),
      ),
    );
  }
}
