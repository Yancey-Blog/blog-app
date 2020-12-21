import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/repositories/repositories.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostListRepository postListRepository;
  final PostDetailRepository postDetailRepository;

  PostBloc({this.postListRepository, this.postDetailRepository})
      : assert(postListRepository != null || postDetailRepository != null),
        super(PostInitial());
  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostListRequested) {
      yield PostLoadInProgress();
      try {
        final posts =
            await postListRepository.fetchPostsByPageAndPageSize(event.page);
        yield PostListLoadSuccess(posts: posts);
      } catch (_, stackTrace) {
        yield PostLoadFailure('$_ $stackTrace');
      }
    }

    if (event is PostDetailRequested) {
      yield PostLoadInProgress();
      try {
        final post = await postDetailRepository.fetchPostById(event.id);
        yield PostDetailLoadSuccess(post: post);
      } catch (_, stackTrace) {
        yield PostLoadFailure('$_ $stackTrace');
      }
    }
  }
}
