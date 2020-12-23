import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlayerControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            CupertinoIcons.backward_end,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24, right: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.play_arrow,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            CupertinoIcons.forward_end,
          ),
        ),
      ],
    );
  }
}
