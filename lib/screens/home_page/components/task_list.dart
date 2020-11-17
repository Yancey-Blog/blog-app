import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final List posts;
  final refetch;

  TaskList(this.posts, this.refetch);

  @override
  _TaskListState createState() => _TaskListState(posts, refetch);
}

class _TaskListState extends State<TaskList> with ChangeNotifier {
  final List posts;
  final refetch;
  String _id;

  _TaskListState(this.posts, this.refetch);

  @override
  void initState() {
    super.initState();
  }

  void onTapped(String id) {
    setState(() {
      _id = id;
    });
    notifyListeners();
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
          onTap: () => onTapped(post['_id'] as String),
        );
      },
    );
  }
}
