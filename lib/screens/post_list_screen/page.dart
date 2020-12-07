import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/post_bloc/repository.dart';
import 'package:blog_app/blocs/blocs.dart';
import './view.dart';

class PostListScreen extends StatelessWidget {
  final PostRepository postRepository;

  PostListScreen({Key key, @required this.postRepository})
      : assert(postRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(postRepository: postRepository),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter fuck GraphQL'),
          ),
          body: PostList()),
    );
  }
}
