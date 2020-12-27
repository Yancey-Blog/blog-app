import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class LRC {
  final Duration time;
  final String text;
  LRC({@required this.time, @required this.text});
}

class LRCView extends StatefulWidget {
  final String lrc;

  final AudioPlayer player;

  LRCView({
    Key key,
    @required this.lrc,
    @required this.player,
  }) : super(key: key);

  @override
  _LRCViewState createState() => _LRCViewState();
}

class _LRCViewState extends State<LRCView> {
  List<LRC> _lrc;

  @override
  void initState() {
    super.initState();
    _lrc = _getLRCList(widget.lrc);
  }

  @override
  void didUpdateWidget(LRCView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _lrc = _getLRCList(widget.lrc);
  }

  // Parses LRC time.
  Duration _parseLRCTime(String timeStr) {
    final res = DateFormat('mm:ss.SSS').parse(timeStr);

    final minutes = res.minute;
    final seconds = res.second;
    final milliseconds = res.millisecond;

    return Duration(
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
    );
  }

  // Gets LRC time string.
  String _getLRCTimeStr(String lrcStr) =>
      RegExp(r'\[\d{2}:\d{2}\.\d{2,3}\]').firstMatch(lrcStr)?.group(0);

  // Gets LRC list.
  List<LRC> _getLRCList(String lrc) {
    final _lrcStrList = lrc.trim().split('\n');

    final _list = <LRC>[];

    _lrcStrList.forEach((element) {
      final _time = _getLRCTimeStr(element);
      final _text = _time == null ? '' : element.split(_time)[1];

      if (_time != null) {
        final _nullSafeTime = _time?.replaceAll(RegExp(r'\[|]'), '');
        _list.add(LRC(time: _parseLRCTime(_nullSafeTime), text: _text));
      }
    });

    return _list;
  }

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

            var _currentLrc = _lrc.lastWhere(
              (element) => position >= element.time,
              orElse: () => null,
            );

            return Container(
              child: Center(
                child: Text(
                  _currentLrc != null ? _currentLrc.text : '',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
