import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:blog_app/models/models.dart';

import './play_control.dart';
import './volume_control.dart';

class PlayerControl extends StatelessWidget {
  final Player player;

  const PlayerControl({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayControl(player: player),
        VolumeControl(),
      ],
    );
  }
}
