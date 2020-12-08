import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/repositories/repositories.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'view.dart';

class PostDetailScreen extends StatelessWidget {
  final PostDetailRepository postDetailRepository;

  PostDetailScreen({Key key, @required this.postDetailRepository})
      : assert(postDetailRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    return BlocProvider(
      create: (context) => PostDetailBloc(
        postDetailRepository: postDetailRepository,
      ),
      child: PostDetailView(id: id),
    );
  }
}