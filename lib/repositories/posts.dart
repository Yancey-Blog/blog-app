import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:blog_app/services/posts.dart';
import 'package:blog_app/models/posts.dart';


class PostRepository {
  final GraphQLClient client;

  PostRepository({
    @required this.client,
  });

  Future<List<PostItem>> getPosts() async {
    final results = await client.query(
      QueryOptions(
        documentNode: gql(posts),
      ),
    );
    if (results.hasException) {
      throw results.exception;
    } else {
      return results.data.posts.items as List<PostItem>;
    }
  }
}