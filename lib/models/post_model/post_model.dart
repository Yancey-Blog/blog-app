import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PostModel extends Equatable {
  final int total;
  final int page;
  final int pageSize;
  final List<PostItem> items;

  const PostModel({
    @required this.total,
    @required this.page,
    @required this.pageSize,
    @required this.items,
  });

  @override
  List<Object> get props => [
        total,
        page,
        pageSize,
        items,
      ];

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      total: json['total'] as int,
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      items: (json['items'] as List<dynamic>)
          .map(
            (i) => PostItem.fromJson(i as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class PostItem {
  final String id;
  final String posterUrl;
  final String title;
  final String summary;
  final String content;
  final List<String> tags;
  final String lastModifiedDate;
  final int like;
  final int pv;
  final bool isPublic;
  final String createdAt;
  final String updatedAt;

  PostItem({
    @required this.id,
    @required this.posterUrl,
    @required this.title,
    @required this.summary,
    @required this.content,
    @required this.tags,
    @required this.lastModifiedDate,
    @required this.like,
    @required this.pv,
    @required this.isPublic,
    @required this.createdAt,
    @required this.updatedAt,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) {
    return PostItem(
      id: json['_id'].toString(),
      posterUrl: json['posterUrl'].toString(),
      title: json['title'].toString(),
      summary: json['summary'].toString(),
      content: json['content'].toString(),
      tags: List<String>.from(json['tags'] as Iterable<dynamic>),
      lastModifiedDate: json['lastModifiedDate'].toString(),
      like: json['like'] as int,
      pv: json['pv'] as int,
      isPublic: json['isPublic'] as bool,
      createdAt: json['createdAt'].toString(),
      updatedAt: json['updatedAt'].toString(),
    );
  }
}
