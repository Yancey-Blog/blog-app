part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  final List<PostItem> posts;
  PostsLoadedState({
    @required this.posts,
  });
}

class PostsErrorState extends PostsState {}
