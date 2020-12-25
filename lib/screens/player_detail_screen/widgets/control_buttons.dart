import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons({
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
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.backward_end,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                onPressed: null,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.forward_end,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Icon(
          CupertinoIcons.arrow_swap,
          color: Colors.black,
        ),
      ],
    );
  }
}
