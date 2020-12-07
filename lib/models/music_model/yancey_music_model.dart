import 'package:blog_app/models/basic_model/basic_model.dart';

class YanceyMusicModel extends BasicModel {
  final String title;
  final String soundCloudUrl;
  final String posterUrl;
  final String releaseDate;

  YanceyMusicModel(
    String id,
    String createdAt,
    String updatedAt,
    this.title,
    this.soundCloudUrl,
    this.posterUrl,
    this.releaseDate,
  ) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
