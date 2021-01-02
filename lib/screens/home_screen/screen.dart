import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/repositories/repositories.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'view.dart';

class HomeScreen extends StatelessWidget {
  final postListRepository = PostListRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(
        postListRepository: postListRepository,
      ),
      child: HomeView(),
    );
  }
}
