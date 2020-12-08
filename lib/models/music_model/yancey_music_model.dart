import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class YanceyMusicModel extends Equatable {
  final String id;
  final String title;
  final String soundCloudUrl;
  final String posterUrl;
  final String releaseDate;
  final String createdAt;
  final String updatedAt;

  YanceyMusicModel({
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

  factory YanceyMusicModel.fromJson(Map<String, dynamic> json) {
    return YanceyMusicModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      soundCloudUrl: json['soundCloudUrl'].toString(),
      posterUrl: json['posterUrl'].toString(),
      releaseDate: json['releaseDate'].toString(),
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
    );
  }
}
