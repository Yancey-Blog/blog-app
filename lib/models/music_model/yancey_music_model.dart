import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class YanceyMusicList extends Equatable {
  final List<YanceyMusic> yanceyMusic;

  YanceyMusicList({
    this.yanceyMusic,
  });

  @override
  List<Object> get props => [
        yanceyMusic,
      ];

  factory YanceyMusicList.fromJson(List<dynamic> json) {
    final yanceyMusic = json
        .map(
          (i) => YanceyMusic.fromJson(i as Map<String, dynamic>),
        )
        .toList();
    return YanceyMusicList(yanceyMusic: yanceyMusic);
  }
}

class YanceyMusic extends Equatable {
  final String id;
  final String title;
  final String soundCloudUrl;
  final String posterUrl;
  final String releaseDate;
  final String createdAt;
  final String updatedAt;

  YanceyMusic({
    @required this.id,
    @required this.title,
    @required this.soundCloudUrl,
    @required this.posterUrl,
    @required this.releaseDate,
    @required this.createdAt,
    @required this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        title,
        soundCloudUrl,
        posterUrl,
        releaseDate,
        createdAt,
        updatedAt,
      ];

  factory YanceyMusic.fromJson(Map<String, dynamic> json) {
    return YanceyMusic(
      id: json['_id'].toString(),
      title: json['title'].toString(),
      soundCloudUrl: json['soundCloudUrl'].toString(),
      posterUrl: json['posterUrl'].toString(),
      releaseDate: json['releaseDate'].toString(),
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
    );
  }
}
