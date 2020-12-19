import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PlayerList extends Equatable {
  final List<Player> players;

  PlayerList({
    this.players,
  });

  @override
  List<Object> get props => [
        players,
      ];

  factory PlayerList.fromJson(List<dynamic> json) {
    final players = json
        .map(
          (i) => Player.fromJson(i as Map<String, dynamic>),
        )
        .toList();
    return PlayerList(players: players);
  }
}

class Player extends Equatable {
  final String id;
  final String title;
  final String artist;
  final String lrc;
  final String coverUrl;
  final String musicFileUrl;
  final String createdAt;
  final String updatedAt;

  Player({
    @required this.id,
    @required this.title,
    @required this.artist,
    @required this.lrc,
    @required this.coverUrl,
    @required this.musicFileUrl,
    @required this.createdAt,
    @required this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        title,
        artist,
        lrc,
        coverUrl,
        musicFileUrl,
        createdAt,
        updatedAt,
      ];

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['_id'].toString(),
      title: json['title'].toString(),
      artist: json['artist'].toString(),
      lrc: json['lrc'].toString(),
      coverUrl: json['coverUrl'].toString(),
      musicFileUrl: json['musicFileUrl'].toString(),
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
    );
  }
}
