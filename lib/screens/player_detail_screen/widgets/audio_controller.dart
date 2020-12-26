import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends StatelessWidget {
  final AudioPlayer player;

  const AudioController({
    Key key,
    @required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          CupertinoIcons.arrow_2_circlepath,
          color: Color(0xff31c27c),
        ),
        Row(
          children: [
            StreamBuilder<SequenceState>(
              stream: player.sequenceStateStream,
              builder: (context, snapshot) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff31c27c)),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(CupertinoIcons.backward_end),
                  color: Color(0xff31c27c),
                  onPressed: player.hasPrevious ? player.seekToPrevious : null,
                ),
              ),
            ),
            StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playing = playerState?.playing;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    width: 64.0,
                    height: 64.0,
                    child: CircularProgressIndicator(),
                  );
                } else if (!playing) {
                  return Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff31c27c)),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        color: Color(0xff31c27c),
                      ),
                      onPressed: player.play,
                    ),
                  );
                } else if (processingState != ProcessingState.completed) {
                  return Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff31c27c)),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Color(0xff31c27c),
                      ),
                      onPressed: player.pause,
                    ),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff31c27c)),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        color: Color(0xff31c27c),
                      ),
                      onPressed: () => player.seek(Duration.zero,
                          index: player.effectiveIndices.first),
                    ),
                  );
                }
              },
            ),
            StreamBuilder<SequenceState>(
              stream: player.sequenceStateStream,
              builder: (context, snapshot) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff31c27c)),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(CupertinoIcons.forward_end),
                  color: Color(0xff31c27c),
                  onPressed: player.hasNext ? player.seekToNext : null,
                ),
              ),
            ),
          ],
        ),
        Icon(
          CupertinoIcons.arrow_swap,
          color: Color(0xff31c27c),
        ),
      ],
    );
  }
}
