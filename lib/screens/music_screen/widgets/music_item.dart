import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/blocs/blocs.dart';

class MusicItem extends StatefulWidget {
  final int index;
  final Player player;

  MusicItem({
    Key key,
    @required this.index,
    @required this.player,
  }) : super(
          key: key,
        );

  @override
  _MusicItemState createState() => _MusicItemState();
}

class _MusicItemState extends State<MusicItem> {
  AudioPlayer audioPlayer = AudioPlayer(playerId: '');

  String formatIndex(int index) {
    final serialNumber = index + 1;
    return serialNumber < 10 ? '0${serialNumber}' : serialNumber.toString();
  }

  void play(BuildContext context, Player music) async {
    BlocProvider.of<PlayerControllerBloc>(context).add(
      MusicItemTapped(music: music),
    );

    await audioPlayer.play(music.musicFileUrl);
  }

  void pause() async {
    await audioPlayer.pause();
  }

  Widget _playerState(
      BuildContext context, PlayerControllerState state, String id) {
    Widget _renderedWidget = IconButton(
      icon: Icon(Icons.play_arrow),
      onPressed: () => play(context, widget.player),
    );

    if (state is CurrentPlayedMusicChanged) {
      if (state.currentPlayedMusic.id == id) {
        _renderedWidget = IconButton(
          icon: Icon(Icons.pause),
          onPressed: pause,
        );
      }
    }

    return _renderedWidget;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerControllerBloc, PlayerControllerState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 12,
            bottom: 12,
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                child: Center(
                  child: Text(
                    formatIndex(widget.index),
                    style: TextStyle(
                      color: Color(0xff93a8b3),
                      fontSize: 12,
                      letterSpacing: .26,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 12, left: 6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.player.coverUrl,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          child: Center(
                            child: Text(
                              widget.player.title,
                              style: TextStyle(
                                color: Color(0xff3c425b),
                                fontSize: 14,
                                letterSpacing: .26,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 14,
                          child: Center(
                            child: Text(
                              widget.player.artist,
                              style: TextStyle(
                                color: Color(0xff93a8b3),
                                fontSize: 12,
                                letterSpacing: .26,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  '···',
                  style: TextStyle(
                    color: Color(0xff93a8b3),
                    fontSize: 24,
                  ),
                ),
              ),
              _playerState(context, state, widget.player.id),
            ],
          ),
        );
      },
    );
  }
}
