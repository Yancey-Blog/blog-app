import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DailyRecommendSkeleton extends StatelessWidget {
  const DailyRecommendSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              width: 310,
              margin: const EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
