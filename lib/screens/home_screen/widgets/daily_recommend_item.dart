import 'package:flutter/material.dart';

import 'package:blog_app/models/models.dart';

class DailyRecommendItem extends StatelessWidget {
  final PostItem post;

  const DailyRecommendItem({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24, top: 220),
            width: 310,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(post.posterUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyle(
                    color: Color(0xfff2f2f2),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  post.lastModifiedDate,
                  style: TextStyle(
                    color: Color(0xfff2f2f2),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 24,
            right: 24,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
