import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends StatefulWidget {
  final AudioPlayer player;

  const AudioController({
    Key key,
    @required this.player,
  }) : super(key: key);

  @override
  _AudioControllerState createState() => _AudioControllerState();
}

class _AudioControllerState extends State<AudioController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 循环播放
          StreamBuilder<LoopMode>(
            stream: widget.player.loopModeStream,
            builder: (context, snapshot) {
              final loopMode = snapshot.data ?? LoopMode.off;
              const icons = [
                Icon(CupertinoIcons.repeat, color: Colors.grey),
                Icon(CupertinoIcons.repeat, color: Color(0xff31c27c)),
                Icon(CupertinoIcons.repeat_1, color: Color(0xff31c27c)),
              ];
              const cycleModes = [
                LoopMode.off,
                LoopMode.all,
                LoopMode.one,
              ];
              final index = cycleModes.indexOf(loopMode);
              return IconButton(
                constraints: BoxConstraints(),
                icon: icons[index],
                color: Color(0xff31c27c),
                onPressed: () {
                  widget.player.setLoopMode(cycleModes[
                      (cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
                },
              );
            },
          ),
          Row(
            children: [
              // 上一首
              StreamBuilder<SequenceState>(
                stream: widget.player.sequenceStateStream,
                builder: (context, snapshot) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff31c27c),
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints(),
                    icon: Icon(CupertinoIcons.backward_end),
                    color: Color(0xff31c27c),
                    disabledColor: Color(0xff31c27c),
                    onPressed: widget.player.hasPrevious
                        ? widget.player.seekToPrevious
                        : null,
                  ),
                ),
              ),
              // 播放/暂停/重新播放/音频加载
              StreamBuilder<PlayerState>(
                stream: widget.player.playerStateStream,
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
                        border: Border.all(
                          color: Color(0xff31c27c),
                          width: 2,
                        ),
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
                        border: Border.all(
                          color: Color(0xff31c27c),
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(14),
                        constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.play_arrow_outlined,
                          color: Color(0xff31c27c),
                        ),
                        onPressed: widget.player.play,
                      ),
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff31c27c),
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(14),
                        constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.pause,
                          color: Color(0xff31c27c),
                        ),
                        onPressed: widget.player.pause,
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      //  padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff31c27c),
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(10),
                        constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.play_arrow,
                          color: Color(0xff31c27c),
                        ),
                        onPressed: () => widget.player.seek(Duration.zero,
                            index: widget.player.effectiveIndices.first),
                      ),
                    );
                  }
                },
              ),
              // 下一首
              StreamBuilder<SequenceState>(
                stream: widget.player.sequenceStateStream,
                builder: (context, snapshot) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff31c27c),
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints(),
                    icon: Icon(CupertinoIcons.forward_end),
                    color: Color(0xff31c27c),
                    disabledColor: Color(0xff31c27c),
                    onPressed:
                        widget.player.hasNext ? widget.player.seekToNext : null,
                  ),
                ),
              ),
            ],
          ),
          // 随机播放
          Icon(
            CupertinoIcons.music_note_list,
            color: Color(0xff31c27c),
          ),
        ],
      ),
    );
  }
}
