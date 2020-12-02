import 'package:blog_app/models/basic_model.dart';

class LiveTourModel extends BasicModel {
  final String title;
  final String posterUrl;
  final String showTime;

  LiveTourModel(String _id, String createdAt, String updatedAt, this.title,
      this.posterUrl, this.showTime)
      : super(_id, createdAt, updatedAt);
}
