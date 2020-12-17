import 'package:flutter/material.dart';
import './music_item.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            child: Image.asset(
              'assets/images/music_screen/top-bg@3x.png',
              width: MediaQuery.of(context).size.width,
              height: 510,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xff0b0f26),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 24, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 0),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 245, 249, 1),
                  ),
                  child: MusicItem(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
