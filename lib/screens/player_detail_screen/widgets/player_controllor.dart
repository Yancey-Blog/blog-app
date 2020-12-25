import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

import 'package:blog_app/models/models.dart';

import './seek_bar.dart';
import './volume_controllor.dart';
import './control_buttons.dart';

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

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  void _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    try {
      await _player.setUrl(widget.audio.musicFileUrl);
    } catch (e) {
      print('An error occured $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
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
        ControlButtons(player: _player),
        VolumeControllor(),
      ],
    );
  }
}
