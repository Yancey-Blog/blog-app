import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:blog_app/models/models.dart';

class RecentItem extends StatelessWidget {
  final PostItem post;

  const RecentItem({Key key, @required this.post}) : super(key: key);

  String _parseDate(String date) {
    final dateTime = DateTime.parse(date);

    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(post.posterUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.tags[0],
                  style: TextStyle(
                    color: Color(0xffe95a7d),
                  ),
                ),
                Text(
                  post.title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.clock,
                      size: 16,
                      color: Color(0xff969696),
                    ),
                    Text(
                      _parseDate(post.createdAt),
                      style: TextStyle(
                        color: Color(0xff969696),
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Color(0xff969696),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      post.like.toString(),
                      style: TextStyle(
                        color: Color(0xff969696),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Color(0xff969696),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
