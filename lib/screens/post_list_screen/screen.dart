import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/post_list_bloc/post_list_repository.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'view.dart';

class PostListScreen extends StatelessWidget {
  final PostListRepository postListRepository;

  PostListScreen({Key key, @required this.postListRepository})
      : assert(postListRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostListBloc(postListRepository: postListRepository),
      child: PostListView(),
    );
  }
}
