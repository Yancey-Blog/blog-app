import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

import 'package:blog_app/models/models.dart';

import 'widgets/seek_bar.dart';
import 'widgets/audio_controller.dart';
import 'widgets/poster.dart';
import 'widgets/meta.dart';

class PlayerDetailView extends StatefulWidget {
  final List<Player> audioFiles;

  PlayerDetailView({
    Key key,
    @required this.audioFiles,
  }) : super(key: key);

  @override
  _PlayerDetailViewState createState() => _PlayerDetailViewState();
}

class _PlayerDetailViewState extends State<PlayerDetailView> {
  AudioPlayer _player;

  ConcatenatingAudioSource _playlist;

  @override
  void initState() {
    super.initState();

    _playlist = ConcatenatingAudioSource(
      children: widget.audioFiles
          .map(
            (el) => AudioSource.uri(
              Uri.parse(el.musicFileUrl),
              tag: el,
            ),
          )
          .toList(),
    );

    _player = AudioPlayer();

    _init();
  }

  void _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    try {
      await _player.setAudioSource(_playlist);
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      print('Error code: ${e.code}');
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web: a generic message
      print('Essos message: ${e.message}');
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      print('Connection aborted: ${e.message}');
    } catch (e) {
      // Fallback for all errors
      print(e);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState>(
      stream: _player.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state?.sequence?.isEmpty ?? true) return SizedBox();
        final metadata = state.currentSource.tag as Player;

        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(metadata.coverUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Poster(cover: metadata.coverUrl),
                        Expanded(
                          child: Meta(audio: metadata),
                        ),
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
                        AudioController(player: _player),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
