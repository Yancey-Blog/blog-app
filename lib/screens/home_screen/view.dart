import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:blog_app/services/post_service/post_service.dart';
import './components/task_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(posts), variables: {
          'input': {
            'page': 1,
            'pageSize': 50,
          },
        }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final _posts = result.data['posts']['items'] as List;

          return Scaffold(
            appBar: AppBar(
              title: Text('Flutter 💋 GraphQL'),
            ),
            body: TaskList(_posts, refetch),
          );
        });
  }
}
