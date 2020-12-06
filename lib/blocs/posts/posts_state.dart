part of 'posts_bloc.dart';

@immutable
abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoaded extends PostsState {
  final PostItem postItemModel;

  PostsLoaded({@required this.postItemModel});

  @override
  List<Object> get props => [postItemModel];
}

class PostsError extends PostsState {
  final String errorMessage;

  const PostsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
