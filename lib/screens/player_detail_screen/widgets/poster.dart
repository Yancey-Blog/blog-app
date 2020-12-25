import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String cover;
  Poster({Key key, @required this.cover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          cover,
          width: 260,
          height: 260,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
