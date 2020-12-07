import 'package:blog_app/models/basic_model/basic_model.dart';

class LiveTourModel extends BasicModel {
  final String title;
  final String posterUrl;
  final String showTime;

  LiveTourModel(
    String id,
    String createdAt,
    String updatedAt,
    this.title,
    this.posterUrl,
    this.showTime,
  ) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
