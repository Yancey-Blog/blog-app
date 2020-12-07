import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/services/post_service/post_service.dart';
import 'components/custom_markdown_component/view.dart';

class PostDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;

    return Query(
        options: QueryOptions(documentNode: gql(getPostById), variables: {
          'id': id,
        }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final _post = result.data['getPostById'];

          return Scaffold(
            appBar: AppBar(
              title: Text(_post['title'] as String),
            ),
            body: SafeArea(
              child: CustomMarkdown(_post['content'] as String),
            ),
          );
        });
  }
}
