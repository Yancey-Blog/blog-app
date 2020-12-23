import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';

class PlayerDetailView extends StatelessWidget {
  final Player player;
  PlayerDetailView({Key key, @required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('caonima'),
        ),
      ),
    );
  }
}
