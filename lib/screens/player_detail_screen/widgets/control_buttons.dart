import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './player_controllor.dart' show PlayStatus;

class ControlButtons extends StatelessWidget {
  final PlayStatus playStatus;

  final Function play;

  final Function pause;

  const ControlButtons({
    Key key,
    @required this.playStatus,
    @required this.play,
    @required this.pause,
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
                  playStatus == PlayStatus.Play
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.black,
                ),
                onPressed:
                    playStatus == PlayStatus.Play ? () => pause : () => play,
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
