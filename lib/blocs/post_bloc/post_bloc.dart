import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:blog_app/models/post_model/post_model.dart';
import 'repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    final posts = await PostRepository().fetchPostsByPageAndPageSize();
  }
}
