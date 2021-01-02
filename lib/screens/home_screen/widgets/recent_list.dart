import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';
import 'recent_item.dart';

class RecentList extends StatelessWidget {
  final List<PostItem> posts;

  const RecentList({Key key, @required this.posts}) : super(key: key);

  void onTapped(BuildContext context, String id) {
    Navigator.pushNamed(context, 'post_detail_screen', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return GestureDetector(
            onTap: () => onTapped(context, post.id),
            child: RecentItem(post: post),
          );
        },
      ),
    );
  }
}
