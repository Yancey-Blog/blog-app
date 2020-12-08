import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LiveTourModel extends Equatable {
  final String id;
  final String title;
  final String posterUrl;
  final String showTime;
  final String createdAt;
  final String updatedAt;

  LiveTourModel({
    @required this.id,
    @required this.title,
    @required this.posterUrl,
    @required this.showTime,
    @required this.createdAt,
    @required this.updatedAt,
  });

  @override
  List<Object> get props => [
        id,
        title,
        posterUrl,
        showTime,
        createdAt,
        updatedAt,
      ];

  factory LiveTourModel.fromJson(Map<String, dynamic> json) {
    return LiveTourModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      posterUrl: json['posterUrl'].toString(),
      showTime: json['showTime'].toString(),
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
    );
  }
}
