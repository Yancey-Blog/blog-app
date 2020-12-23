import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './play_control.dart';
import './volume_control.dart';

class PlayerControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayControl(),
        VolumeControl(),
      ],
    );
  }
}
