import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:blog_app/models/models.dart';

import 'switch_play_controllor.dart';
import 'volume_controllor.dart';

class PlayerControllor extends StatelessWidget {
  final Player player;

  const PlayerControllor({Key key, @required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchPlayControllor(player: player),
        VolumeControllor(),
      ],
    );
  }
}
