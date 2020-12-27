import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';

import 'lrc.dart';

class Meta extends StatelessWidget {
  final Player audio;

  const Meta({Key key, this.audio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24, bottom: 12),
          child: Text(
            audio.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 12,
          ),
          child: Text(
            audio.artist,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        LRCView(lrc: audio.lrc),
      ],
    );
  }
}
