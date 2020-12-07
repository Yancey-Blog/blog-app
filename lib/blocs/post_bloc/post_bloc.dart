import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:blog_app/models/post_model/post_model.dart';
import 'repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({@required this.postRepository})
      : assert(postRepository != null),
        super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostRequested) {
      yield PostLoadInProgress();
      try {
        final posts =
            await postRepository.fetchPostsByPageAndPageSize(event.page);
        yield PostLoadSuccess(posts: posts);
      } catch (_) {
        yield PostLoadFailure('我错了');
      }
    }
  }
}
