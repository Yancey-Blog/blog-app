import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {
  final int index;

  const MusicItem({Key key, @required this.index}) : super(key: key);

  String formatIndex(int index) {
    final serialNumber = index + 1;
    return serialNumber < 10 ? '0${serialNumber}' : serialNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            child: Center(
              child: Text(
                formatIndex(index),
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
                    child: Image.asset(
                      'assets/images/music_screen/top-bg@3x.png',
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
                          'Mirage',
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
                          'Else',
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
    );
  }
}
