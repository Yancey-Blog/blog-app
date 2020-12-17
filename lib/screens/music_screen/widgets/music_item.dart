import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 24,
              height: 24,
              child: Text(
                '01',
                style: TextStyle(
                  color: Color(0xff93a8b3),
                  fontSize: 12,
                  letterSpacing: .26,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Image.asset(
                'assets/images/music_screen/top-bg@3x.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  const Radius.circular(8),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mirage',
                  style: TextStyle(
                    color: Color(0xff3c425b),
                    fontSize: 14,
                    letterSpacing: .26,
                  ),
                ),
                Text(
                  'Else',
                  style: TextStyle(
                    color: Color(0xff93a8b3),
                    fontSize: 12,
                    letterSpacing: .26,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          '◕‿◕',
          style: TextStyle(
            color: Color(0xff93a8b3),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
