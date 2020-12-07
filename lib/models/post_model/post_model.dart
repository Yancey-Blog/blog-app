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

  factory PostModel.fromJson(dynamic json) {
    return PostModel(
      total: json['total'] as int,
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      items: List<PostItem>.from(
        (json['items'] as List<PostItem>).map(
          (x) => PostItem.fromJson(x),
        ),
      ),
    );
  }
}

class PostItem {
  final String id;
  final String posterUrl;
  final String title;
  final String summary;
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
    @required this.tags,
    @required this.lastModifiedDate,
    @required this.like,
    @required this.pv,
    @required this.isPublic,
    @required this.createdAt,
    @required this.updatedAt,
  });

  factory PostItem.fromJson(dynamic json) {
    return PostItem(
      id: json['_id'] as String,
      posterUrl: json['posterUrl'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      tags: json['tags'] as List<String>,
      lastModifiedDate: json['lastModifiedDate'] as String,
      like: json['like'] as int,
      pv: json['like'] as int,
      isPublic: json['isPublic'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
