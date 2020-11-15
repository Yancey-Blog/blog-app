class PostModel {
  int total;
  int page;
  int pageSize;

  List<PostItem> items;
}

class PostItem {
  String posterUrl;
  String title;
  String summary;
  List<String> tags;
  String lastModifiedDate;
  int like;
  int pv;
  bool isPublic;
  String createdAt;
  String updatedAt;

  PostItem(
      {this.posterUrl,
      this.title,
      this.summary,
      this.tags,
      this.lastModifiedDate,
      this.like,
      this.pv,
      this.isPublic,
      this.createdAt,
      this.updatedAt});
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
