abstract class PostModel {
  static int total;

  static int page;

  static int pageSize;

  static List<PostItem> items;
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

  const PostItem(
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
  final int page;
  final int pageSize;

  const PostsVariables(this.page, this.pageSize);
}

class Variables<T> {
  final T input;
  const Variables(this.input);
}
