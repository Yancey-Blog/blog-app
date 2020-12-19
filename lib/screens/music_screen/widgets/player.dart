import 'package:flutter/material.dart';
import './music_item.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(
          top: 300,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/music_screen/top-bg@3x.png'),
              fit: BoxFit.contain),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return MusicItem(index: index);
                },
              ),
            ),
          ],
        ));
  }
}
