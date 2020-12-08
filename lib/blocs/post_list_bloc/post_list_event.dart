part of 'post_list_bloc.dart';

@immutable
abstract class PostListEvent extends Equatable {
  const PostListEvent();
}

class PostListRequested extends PostListEvent {
  final int page;
  final int pageSize;

  const PostListRequested({@required this.page, this.pageSize = 10})
      : assert(page != null);

  @override
  List<Object> get props => [page];
}
