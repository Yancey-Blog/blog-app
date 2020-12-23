import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/blocs/blocs.dart';

enum PlayerStatus { Playing, Paused, Stopped }

class PlayControl extends StatefulWidget {
  final Player player;

  PlayControl({
    Key key,
    @required this.player,
  }) : super(key: key);

  @override
  _PlayControlState createState() => _PlayControlState();
}

class _PlayControlState extends State<PlayControl> {
  PlayerStatus _playerStatus = PlayerStatus.Stopped;

  AudioPlayer audioPlayer = AudioPlayer(playerId: '');

  void play(Player player) async {
    await audioPlayer.play(player.musicFileUrl);

    setState(() {
      _playerStatus = PlayerStatus.Playing;
    });
  }

  void pause() async {
    await audioPlayer.pause();

    setState(() {
      _playerStatus = PlayerStatus.Paused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerControllerBloc, PlayerControllerState>(
        builder: (context, state) {
      return Row(
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
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: _playerStatus == PlayerStatus.Paused
                    ? IconButton(
                        icon: Icon(Icons.pause),
                        onPressed: () => play(widget.player),
                      )
                    : IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: pause,
                      ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.arrow_swap,
                ),
              ),
            ],
          ),
          Icon(
            CupertinoIcons.backward_end,
          ),
        ],
      );
    });
  }
}
