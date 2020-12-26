import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SeekBar extends StatefulWidget {
  final AudioPlayer player;

  SeekBar({
    @required this.player,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: widget.player.durationStream,
      builder: (context, snapshot) {
        final duration = snapshot.data ?? Duration.zero;
        return StreamBuilder<Duration>(
          stream: widget.player.positionStream,
          builder: (context, snapshot) {
            var position = snapshot.data ?? Duration.zero;
            if (position > duration) {
              position = duration;
            }

            final _remaining = duration - position;

            return Stack(
              children: [
                Slider(
                  min: 0.0,
                  max: duration.inMilliseconds.toDouble(),
                  value: min(_dragValue ?? position.inMilliseconds.toDouble(),
                      duration.inMilliseconds.toDouble()),
                  onChanged: (value) {
                    setState(() {
                      _dragValue = value;
                    });

                    widget.player.seek(Duration(milliseconds: value.round()));
                  },
                  onChangeEnd: (value) {
                    widget.player.seek(Duration(milliseconds: value.round()));
                    _dragValue = null;
                  },
                ),
                Positioned(
                  right: 16.0,
                  bottom: 0.0,
                  child: Text(
                    RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                            .firstMatch('$_remaining')
                            ?.group(1) ??
                        '$_remaining',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
