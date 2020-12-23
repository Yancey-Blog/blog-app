import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';
import 'view.dart';

class PlayerDetailScreen extends StatelessWidget {
  PlayerDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = ModalRoute.of(context).settings.arguments as Player;
    return PlayerDetailView(player: player);
  }
}
