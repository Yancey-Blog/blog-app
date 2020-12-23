import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';

class Poster extends StatelessWidget {
  final Player player;
  Poster({Key key, @required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          player.coverUrl,
          width: 260,
          height: 260,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
