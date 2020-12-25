import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';

import 'widgets/poster.dart';
import 'widgets/meta.dart';
import 'widgets/player_controllor.dart';

class PlayerDetailView extends StatelessWidget {
  final List<Player> audioFiles;
  PlayerDetailView({Key key, @required this.audioFiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(audioFiles[0].coverUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.white.withOpacity(0.5),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Poster(player: audioFiles[0]),
                    Expanded(
                      child: Meta(player: audioFiles[0]),
                    ),
                    PlayerControllor(audioFiles: audioFiles),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
