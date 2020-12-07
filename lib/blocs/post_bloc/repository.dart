import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/graphql/apollo_client.dart';
import 'package:blog_app/services/post_service/post_service.dart';
import 'package:blog_app/models/post_model/post_model.dart';

class PostRepository {
  Future<List<PostItem>> fetchPostsByPageAndPageSize(int page) async {
    final result = await client.query(
      QueryOptions(
        documentNode: gql(posts),
        variables: {
          'input': {
            'page': 1,
            'pageSize': 10,
          },
        },
      ),
    );

    if (result.hasException) {
      throw result.exception;
    }

    final items = result.data['posts']['items'] as List<dynamic>;
    final _items = items
        .map(
          (dynamic e) => PostItem(
            id: e['_id'] as String,
            posterUrl: e['posterUrl'] as String,
            title: e['title'] as String,
            summary: e['summary'] as String,
            // tags: e['tags'] as List<String>,
            lastModifiedDate: e['lastModifiedDate'] as String,
            like: e['like'] as int,
            pv: e['pv'] as int,
            isPublic: e['isPublic'] as bool,
            createdAt: e['createdAt'] as String,
            updatedAt: e['updatedAt'] as String,
          ),
        )
        .toList();

    // final _data = PostModel.fromJson(result.data['posts']);

    return _items;
  }
}
