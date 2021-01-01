import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:blog_app/models/models.dart';

class PlayList extends StatelessWidget {
  final AudioPlayer player;

  const PlayList({
    Key key,
    @required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Stack(
          children: [
            StreamBuilder<SequenceState>(
              stream: player.sequenceStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                final sequence = state?.sequence ?? [];

                return ListView.builder(
                  itemCount: sequence.length,
                  itemBuilder: (context, index) {
                    final matadata = sequence[index].tag as Player;

                    return ListTile(
                      title: Text(
                        '${matadata.title} - ${matadata.artist}',
                        style: TextStyle(
                          color: index == state.currentIndex
                              ? Colors.blueAccent
                              : null,
                        ),
                      ),
                      onTap: () {
                        player
                          ..seek(Duration.zero, index: index)
                          ..play();
                      },
                    );
                  },
                );
              },
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: SafeArea(
                child: Center(
                  child: Text(
                    '关闭',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
