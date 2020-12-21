part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostListRequested extends PostEvent {
  final int page;
  final int pageSize;

  const PostListRequested({@required this.page, this.pageSize = 10})
      : assert(page != null);

  @override
  List<Object> get props => [page];
}

class PostDetailRequested extends PostEvent {
  final String id;

  const PostDetailRequested({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}
