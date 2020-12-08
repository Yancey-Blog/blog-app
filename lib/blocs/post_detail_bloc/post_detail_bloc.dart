import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/repositories/repositories.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostDetailRepository postDetailRepository;

  PostDetailBloc({@required this.postDetailRepository})
      : assert(postDetailRepository != null),
        super(PostDetailInitial());

  @override
  Stream<PostDetailState> mapEventToState(
    PostDetailEvent event,
  ) async* {
    if (event is PostDetailRequested) {
      yield PostDetailLoadInProgress();
      try {
        final post = await postDetailRepository.fetchPostById(event.id);
        yield PostDetailLoadSuccess(post: post);
      } catch (_, stackTrace) {
        yield PostDetailLoadFailure('$_ $stackTrace');
      }
    }
  }
}
