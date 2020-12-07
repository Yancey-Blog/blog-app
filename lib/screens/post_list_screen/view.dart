import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

class ScreenArguments {
  final String id;
  ScreenArguments(this.id);
}

class PostList extends StatefulWidget {
  PostList({Key key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void onTapped(BuildContext context, String id) {
    Navigator.pushNamed(context, 'post_detail_screen', arguments: id);
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostBloc>(context).add(PostRequested(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          return Center(child: Text('Please Select a Location'));
        }
        if (state is PostLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PostLoadSuccess) {
          final posts = state.posts;

          return ListView.builder(
            itemCount: posts.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final post = posts[index];

              return ListTile(
                title: Text(post.title),
                // subtitle: Text((post.tags).join(', ')),
                onTap: () => onTapped(context, post.id),
              );
            },
          );
        }

        if (state is PostLoadFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
