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
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 循环播放
          Icon(
            CupertinoIcons.arrow_2_circlepath,
            color: Color(0xff31c27c),
          ),
          Row(
            children: [
              // 上一首
              StreamBuilder<SequenceState>(
                stream: player.sequenceStateStream,
                builder: (context, snapshot) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff31c27c)),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints(),
                    icon: Icon(CupertinoIcons.backward_end),
                    color: Color(0xff31c27c),
                    disabledColor: Color(0xff31c27c),
                    onPressed:
                        player.hasPrevious ? player.seekToPrevious : null,
                  ),
                ),
              ),
              // 播放/暂停/重新播放/音频加载
              StreamBuilder<PlayerState>(
                stream: player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing =
                      playerState != null ? playerState.playing : false;

                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff31c27c)),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(14),
                        constraints: BoxConstraints(),
                        icon: CircularProgressIndicator(),
                        onPressed: null,
                      ),
                    );
                  } else if (!playing) {
                    return Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff31c27c)),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(14),
                        constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.play_arrow_outlined,
                          color: Color(0xff31c27c),
                        ),
                        onPressed: player.play,
                      ),
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff31c27c)),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(14),
                        constraints: BoxConstraints(),
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
                      //  padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff31c27c)),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(10),
                        constraints: BoxConstraints(),
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
              // 下一首
              StreamBuilder<SequenceState>(
                stream: player.sequenceStateStream,
                builder: (context, snapshot) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff31c27c)),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints(),
                    icon: Icon(CupertinoIcons.forward_end),
                    color: Color(0xff31c27c),
                    disabledColor: Color(0xff31c27c),
                    onPressed: player.hasNext ? player.seekToNext : null,
                  ),
                ),
              ),
            ],
          ),
          // 随机播放
          Icon(
            CupertinoIcons.arrow_swap,
            color: Color(0xff31c27c),
          ),
        ],
      ),
    );
  }
}
