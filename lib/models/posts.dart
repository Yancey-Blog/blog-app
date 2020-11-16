class PostModel {
  final int total;
  final int page;
  final int pageSize;
  final List<PostItem> items;

  PostModel(this.total, this.page, this.pageSize, this.items);
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
