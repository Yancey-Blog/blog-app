import 'package:flutter/material.dart';

import 'package:blog_app/models/models.dart';

class RecentItem extends StatelessWidget {
  final PostItem post;

  const RecentItem({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 24),
          padding: const EdgeInsets.only(left: 24, top: 250),
          width: 310,
          height: 316,
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
              Text(post.title),
              SizedBox(
                height: 12,
              ),
              Text(post.lastModifiedDate),
            ],
          ),
        ),
        Positioned(
          top: 24,
          right: 24,
          child: Icon(Icons.favorite),
        ),
      ],
    );
  }
}
