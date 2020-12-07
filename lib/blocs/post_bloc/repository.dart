import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/graphql/apollo_client.dart';
import 'package:blog_app/services/post_service/post_service.dart';
import 'package:blog_app/models/post_model/post_model.dart';

class PostRepository {
  Future<List<PostItem>> fetchPostsByPageAndPageSize() async {
    final result = await client.query(
      QueryOptions(
        documentNode: gql(posts),
        variables: {
          'input': {'page': 1, 'pageSize': 10},
        },
      ),
    );
    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['posts']['items'] as List<PostItem>;
    return data;

    // const res = <PostItem>[];
    // data.forEach(
    //   (el) {
    //     res.add(
    //       PostItem(
    //         posterUrl: el.posterUrl,
    //         title: el.title,
    //         summary: el.title,
    //         tags: el.tags,
    //         lastModifiedDate: el.lastModifiedDate,
    //         like: el.like,
    //         pv: el.pv,
    //         isPublic: el.isPublic,
    //         createdAt: el.createdAt,
    //         updatedAt: el.updatedAt,
    //       ),
    //     );
    //   },
    // );
    // return res;
  }
}
