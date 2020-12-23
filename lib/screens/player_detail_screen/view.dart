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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Poster(player: player),
              Expanded(
                child: Meta(player: player),
              ),
              PlayerControl(),
            ],
          ),
        ),
      ),
    );
  }
}
