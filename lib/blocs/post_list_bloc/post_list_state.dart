part of 'post_list_bloc.dart';

@immutable
abstract class PostListState extends Equatable {
  const PostListState();

  @override
  List<Object> get props => [];
}

class PostListInitial extends PostListState {}

class PostListLoadInProgress extends PostListState {}

class PostListLoadSuccess extends PostListState {
  final List<PostItem> posts;

  const PostListLoadSuccess({@required this.posts}) : assert(posts != null);

  @override
  List<Object> get props => [posts];
}

class PostListLoadFailure extends PostListState {
  final String errorMessage;

  const PostListLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
