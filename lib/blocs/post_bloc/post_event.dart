part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostRequested extends PostEvent {
  final int page;
  final int pageSize;

  const PostRequested({@required this.page, this.pageSize = 10})
      : assert(page != null);

  @override
  List<Object> get props => [page];
}
