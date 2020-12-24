import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';
import 'player_item.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;

  const PlayerList({Key key, @required this.players}) : super(key: key);

  void onTapped(BuildContext context, Player player) {
    Navigator.pushNamed(context, 'player_detail_screen', arguments: player);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(
        top: 300,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/music_screen/top-bg@3x.png'),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Recommended',
              style: TextStyle(
                fontSize: 32,
                color: Color(0xff0b0f26),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final player = players[index];
                return GestureDetector(
                  onTap: () => onTapped(context, player),
                  child: PlayerItem(index: index, player: player),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
