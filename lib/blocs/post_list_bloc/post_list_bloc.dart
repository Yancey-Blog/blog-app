import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/repositories/repositories.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PostListRepository postListRepository;

  PostListBloc({@required this.postListRepository})
      : assert(postListRepository != null),
        super(PostListInitial());

  @override
  Stream<PostListState> mapEventToState(
    PostListEvent event,
  ) async* {
    if (event is PostListRequested) {
      yield PostListLoadInProgress();
      try {
        final posts =
            await postListRepository.fetchPostsByPageAndPageSize(event.page);
        yield PostListLoadSuccess(posts: posts);
      } catch (_, stackTrace) {
        yield PostListLoadFailure('$_ $stackTrace');
      }
    }
  }
}
