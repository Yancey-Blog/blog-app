import 'package:blog_app/models/basic_model.dart';

class YanceyMusicModel extends BasicModel {
  final String title;
  final String soundCloudUrl;
  final String posterUrl;
  final String releaseDate;

  YanceyMusicModel(String _id, String createdAt, String updatedAt, this.title,
      this.soundCloudUrl, this.posterUrl, this.releaseDate)
      : super(_id, createdAt, updatedAt);
}
