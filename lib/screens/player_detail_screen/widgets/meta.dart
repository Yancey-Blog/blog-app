import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';
import 'package:just_audio/just_audio.dart';

import 'lrc.dart';

class Meta extends StatelessWidget {
  final Player audio;
  final AudioPlayer player;

  const Meta({Key key, @required this.audio, @required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 32, bottom: 12),
          child: Text(
            audio.title,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 16,
          ),
          child: Text(
            audio.artist,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        LRCView(
          lrc: audio.lrc,
          player: player,
        ),
      ],
    );
  }
}
