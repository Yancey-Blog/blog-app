part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoadInProgress extends PostState {}

class PostListLoadSuccess extends PostState {
  final List<PostItem> posts;

  const PostListLoadSuccess({@required this.posts}) : assert(posts != null);

  @override
  List<Object> get props => [posts];
}

class PostDetailLoadSuccess extends PostState {
  final PostItem post;

  const PostDetailLoadSuccess({@required this.post}) : assert(post != null);

  @override
  List<Object> get props => [post];
}

class PostLoadFailure extends PostState {
  final String errorMessage;

  const PostLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
