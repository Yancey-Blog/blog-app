import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  FavoriteView({Key key}) : super(key: key);

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('favorite'),
      ),
    );
  }
}
