import 'package:flutter/material.dart';
import 'package:blog_app/models/models.dart';
import 'daily_recommend_item.dart';

class DailyRecommendList extends StatelessWidget {
  final List<PostItem> posts;

  const DailyRecommendList({Key key, @required this.posts}) : super(key: key);

  void onTapped(BuildContext context, String id) {
    Navigator.pushNamed(context, 'post_detail_screen', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return GestureDetector(
            onTap: () => onTapped(context, post.id),
            child: DailyRecommendItem(post: post),
          );
        },
      ),
    );
  }
}
