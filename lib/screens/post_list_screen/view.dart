import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/blocs/blocs.dart';

class ScreenArguments {
  final String id;
  ScreenArguments(this.id);
}

class PostListView extends StatefulWidget {
  PostListView({Key key}) : super(key: key);

  @override
  _PostListViewState createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  void onTapped(BuildContext context, String id) {
    Navigator.pushNamed(context, 'post_detail_screen', arguments: id);
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostListBloc>(context).add(PostListRequested(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        Widget _renderedWidget = Container();

        if (state is PostListLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PostListLoadSuccess) {
          final posts = state.posts;

          _renderedWidget = ListView.builder(
            itemCount: posts.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final post = posts[index];

              return ListTile(
                title: Text(post.title),
                subtitle: Text((post.tags).join(', ')),
                onTap: () => onTapped(context, post.id),
              );
            },
          );
        }

        if (state is PostListLoadFailure) {
          _renderedWidget = Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('列表页'),
          ),
          body: _renderedWidget,
        );
      },
    );
  }
}
