import 'package:flutter/material.dart';

class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}

class TaskList extends StatelessWidget {
  final List posts;
  final refetch;

  TaskList(this.posts, this.refetch);

  void onTapped(BuildContext context, String id) {
    Navigator.pushNamed(context, 'post_detail_page',
        arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final post = posts[index];

        return ListTile(
          title: Text(post['title'] as String),
          subtitle: Text((post['tags'] as List).join(', ')),
          onTap: () => onTapped(context, post['_id'] as String),
        );
      },
    );
  }
}
