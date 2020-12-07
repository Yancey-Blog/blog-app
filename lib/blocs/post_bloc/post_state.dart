part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoadInProgress extends PostState {}

class PostLoadSuccess extends PostState {
  final List<PostItem> posts;

  const PostLoadSuccess({@required this.posts}) : assert(posts != null);

  @override
  List<Object> get props => [posts];
}

class PostLoadFailure extends PostState {
  final String errorMessage;

  const PostLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
