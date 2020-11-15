import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_app/models/posts.dart';
import 'package:blog_app/repositories/posts.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postRepository;
  PostsBloc({
    @required this.postRepository,
  }) : super(PostsInitial());

  @override
  get initialState => PostsInitial();

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    if (event is PostsLoadEvent) {
      try {
        yield PostsLoadingState();
        final posts = await postRepository.getPosts();
        yield PostsLoadedState(
          posts: posts,
        );
      } catch (error) {
        yield PostsErrorState();
      }
    }
  }
}
