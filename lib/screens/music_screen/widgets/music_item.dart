import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:blog_app/models/models.dart';

class MusicItem extends StatefulWidget {
  final int index;
  final Player players;
  MusicItem({
    Key key,
    @required this.index,
    @required this.players,
  }) : super(
          key: key,
        );
  @override
  _MusicItemState createState() => _MusicItemState();
}

class _MusicItemState extends State<MusicItem> {
  var _currentPlayedAudioId = '';

  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  String formatIndex(int index) {
    final serialNumber = index + 1;
    return serialNumber < 10 ? '0${serialNumber}' : serialNumber.toString();
  }

  @override
  void initState() {
    super.initState();

    // AudioPlayer.logEnabled = true;

    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      audioPlayer.startHeadlessService();
    }
  }

  void playHandler(String url, String id) async {
    if (_currentPlayedAudioId != id) {
      final result = await audioPlayer.play(url);
      setState(() {
        _currentPlayedAudioId = id;
      });
    }

    if (_currentPlayedAudioId == id) {
      final result = await audioPlayer.stop();

      setState(() {
        _currentPlayedAudioId = '';
      });
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await audioPlayer.release();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => playHandler(widget.players.musicFileUrl, widget.players.id),
      child: Container(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
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
                        widget.players.coverUrl,
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
                            widget.players.title,
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
                            widget.players.artist,
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
          ],
        ),
      ),
    );
  }
}
