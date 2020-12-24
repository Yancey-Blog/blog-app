import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:blog_app/models/models.dart';

import 'player_controllor.dart';
import 'volume_controllor.dart';

class PlayerControllorWrapper extends StatelessWidget {
  final Player player;

  const PlayerControllorWrapper({Key key, @required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerControllor(player: player),
        VolumeControllor(),
      ],
    );
  }
}
