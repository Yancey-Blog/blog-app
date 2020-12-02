import 'package:meta/meta.dart';

class PostModel {
  final int total;
  final int page;
  final int pageSize;
  final List<PostItem> items;

  PostModel(
      {@required this.total,
      @required this.page,
      @required this.pageSize,
      @required this.items});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'total': total,
      'page': page,
      'pageSize': pageSize,
      'items': items,
    };
  }

  static PostModel fromJson(Map<String, dynamic> map) => PostModel(
        total: map['total'] as int,
        page: map['page'] as int,
        pageSize: map['pageSize'] as int,
        items: map['items'] as List<PostItem>,
      );
}

class PostItem {
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

  PostItem(
      this.posterUrl,
      this.title,
      this.summary,
      this.tags,
      this.lastModifiedDate,
      this.like,
      this.pv,
      this.isPublic,
      this.createdAt,
      this.updatedAt);
}

class PostsVariables {
  int page;
  int pageSize;

  PostsVariables(this.page, this.pageSize);
}

class Variables<T> {
  T input;
  Variables(this.input);
}
