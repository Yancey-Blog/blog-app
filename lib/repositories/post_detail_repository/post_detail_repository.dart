import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/graphql/apollo_client.dart';

import 'package:blog_app/services/services.dart';
import 'package:blog_app/models/models.dart';

class PostDetailRepository {
  Future<PostItem> fetchPostById(String id) async {
    final result = await client.query(
      QueryOptions(
        documentNode: gql(getPostById),
        variables: {
          'id': id,
        },
      ),
    );

    if (result.hasException) {
      throw result.exception;
    }

    final post =
        PostItem.fromJson(result.data['getPostById'] as Map<String, dynamic>);

    return post;
  }
}
