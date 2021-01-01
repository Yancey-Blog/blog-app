import 'package:flutter/material.dart';

import 'package:blog_app/widgets/drawer.dart';

class PlayListDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          left: 0.0,
          child: CustomDrawer(
            show: true,
            child: Center(child: Text('caomi')),
          ),
        ),
      ],
    );
  }
}
