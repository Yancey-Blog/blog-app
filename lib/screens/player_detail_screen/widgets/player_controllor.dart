import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

import 'package:blog_app/models/models.dart';

import './seek_bar.dart';
import './volume_controllor.dart';
import './control_buttons.dart';

enum PlayStatus { Play, Pause, Stop }

class PlayerControllor extends StatefulWidget {
  final Player audio;

  PlayerControllor({
    Key key,
    @required this.audio,
  }) : super(key: key);

  @override
  _PlayerControllorState createState() => _PlayerControllorState();
}

class _PlayerControllorState extends State<PlayerControllor> {
  AudioPlayer _player;
  PlayStatus _playStatus = PlayStatus.Stop;
  Duration _duration;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    print(volume);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  double get volume => _player.volume;

  void play() async {
    setState(() {
      _playStatus = PlayStatus.Play;
    });

    var duration = await _player.setUrl(widget.audio.musicFileUrl);

    setState(() {
      _duration = duration;
    });

    await _player.play();
  }

  void pause() async {
    setState(() {
      _playStatus = PlayStatus.Pause;
    });

    await _player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<Duration>(
          stream: _player.durationStream,
          builder: (context, snapshot) {
            final duration = snapshot.data ?? Duration.zero;
            return StreamBuilder<Duration>(
              stream: _player.positionStream,
              builder: (context, snapshot) {
                var position = snapshot.data ?? Duration.zero;
                if (position > duration) {
                  position = duration;
                }
                return SeekBar(
                  duration: duration,
                  position: position,
                  onChangeEnd: (newPosition) {
                    _player.seek(newPosition);
                  },
                );
              },
            );
          },
        ),
        ControlButtons(playStatus: _playStatus),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              CupertinoIcons.arrow_2_circlepath,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.backward_end,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      _playStatus == PlayStatus.Play
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.black,
                    ),
                    onPressed: _playStatus == PlayStatus.Play ? pause : play,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.forward_end,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Icon(
              CupertinoIcons.arrow_swap,
              color: Colors.black,
            ),
          ],
        ),
        VolumeControllor(),
      ],
    );
  }
}
