import 'package:blog_app/models/basic_model/basic_model.dart';

class BestAlbumModel extends BasicModel {
  final String title;
  final String artist;
  final String coverUrl;
  final String mvUrl;
  final String releaseDate;

  BestAlbumModel(
    String id,
    String createdAt,
    String updatedAt,
    this.title,
    this.artist,
    this.coverUrl,
    this.mvUrl,
    this.releaseDate,
  ) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
