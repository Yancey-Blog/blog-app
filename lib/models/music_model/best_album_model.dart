import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BestAlbumList extends Equatable {
  final List<BestAlbum> bestAlbums;

  BestAlbumList({
    this.bestAlbums,
  });

  @override
  List<Object> get props => [
        bestAlbums,
      ];

  factory BestAlbumList.fromJson(List<dynamic> json) {
    final bestAlbums = json
        .map(
          (i) => BestAlbum.fromJson(i as Map<String, dynamic>),
        )
        .toList();
    return BestAlbumList(bestAlbums: bestAlbums);
  }
}

class BestAlbum extends Equatable {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final String mvUrl;
  final String releaseDate;
  final String createdAt;
  final String updatedAt;

  BestAlbum({
    @required this.id,
    @required this.title,
    @required this.artist,
    @required this.coverUrl,
    @required this.mvUrl,
    @required this.releaseDate,
    @required this.createdAt,
    @required this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        title,
        artist,
        coverUrl,
        mvUrl,
        releaseDate,
        createdAt,
        updatedAt,
      ];

  factory BestAlbum.fromJson(Map<String, dynamic> json) {
    return BestAlbum(
      id: json['_id'].toString(),
      title: json['title'].toString(),
      artist: json['artist'].toString(),
      coverUrl: json['coverUrl'].toString(),
      mvUrl: json['mvUrl'].toString(),
      releaseDate: json['releaseDate'].toString(),
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
    );
  }
}
