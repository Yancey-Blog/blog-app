import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';

import './widgets/poster.dart';
import './widgets/meta.dart';
import './widgets/player_control.dart';

class PlayerDetailView extends StatelessWidget {
  final Player player;
  PlayerDetailView({Key key, @required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Poster(player: player),
          Meta(player: player),
          PlayerControl(),
        ],
      ),
    );
  }
}
