import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/graphql/apollo_client.dart';
import 'package:blog_app/services/post_service/post_service.dart';
import 'package:blog_app/models/post_model/post_model.dart';

class PostListRepository {
  Future<List<PostItem>> fetchPostsByPageAndPageSize(int page) async {
    final result = await client.query(
      QueryOptions(
        documentNode: gql(posts),
        variables: {
          'input': {
            'page': 1,
            'pageSize': 40,
          },
        },
      ),
    );

    if (result.hasException) {
      throw result.exception;
    }

    final list =
        PostModel.fromJson(result.data['posts'] as Map<String, dynamic>);

    return list.items;
  }
}
