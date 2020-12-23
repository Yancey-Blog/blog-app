import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlayerControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: null,
          icon: Icon(
            CupertinoIcons.backward_end,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            CupertinoIcons.play,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            CupertinoIcons.forward_end,
          ),
        )
      ],
    );
  }
}
