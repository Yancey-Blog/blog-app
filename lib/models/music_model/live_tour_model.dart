import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LiveTourList extends Equatable {
  final List<LiveTour> liveTours;

  LiveTourList({
    this.liveTours,
  });

  @override
  List<Object> get props => [
        liveTours,
      ];

  factory LiveTourList.fromJson(List<dynamic> json) {
    final liveTours = json
        .map(
          (i) => LiveTour.fromJson(i as Map<String, dynamic>),
        )
        .toList();
    return LiveTourList(liveTours: liveTours);
  }
}

class LiveTour extends Equatable {
  final String id;
  final String title;
  final String posterUrl;
  final String showTime;
  final String createdAt;
  final String updatedAt;

  LiveTour({
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

  factory LiveTour.fromJson(Map<String, dynamic> json) {
    return LiveTour(
      id: json['_id'].toString(),
      title: json['title'].toString(),
      posterUrl: json['posterUrl'].toString(),
      showTime: json['showTime'].toString(),
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
    );
  }
}
