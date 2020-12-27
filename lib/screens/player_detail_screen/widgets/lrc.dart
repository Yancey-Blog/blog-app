import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LRC {
  final int time;
  final String text;
  LRC({@required this.time, @required this.text});
}

class LRCView extends StatefulWidget {
  final String lrc;
  LRCView({Key key, @required this.lrc}) : super(key: key);

  @override
  _LRCViewState createState() => _LRCViewState();
}

class _LRCViewState extends State<LRCView> {
  @override
  void initState() {
    super.initState();
  }

  // Parses LRC time.
  int _parseLRCTime(String timeStr) {
    final res = DateFormat('mm:ss.SSS').parse(timeStr);
    final minute = res.minute;
    final second = res.second;
    final milliseconds = res.millisecond;

    return minute * 60 * 1000 + second * 1000 + milliseconds;
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
    return Container(
      child: Center(
        child: Text('xxx'),
      ),
    );
  }
}
