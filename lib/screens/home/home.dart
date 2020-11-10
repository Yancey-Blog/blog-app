import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:blog_app/services/posts.dart';
import '../../widgets/bottom_navigation_bar.dart';
import '../../shared/utils.dart' show launchUrl;
// import 'package:blog_app/models/posts.dart';

class HomePage extends StatelessWidget {
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
          if (result.hasException) Text(result.exception.toString());
          if (result.loading) CircularProgressIndicator();

          final posts = result.data['posts']['items'];

          return Scaffold(
            appBar: AppBar(
              title: Text('Flutter 💋 GraphQL'),
            ),
            body: TaskList(posts, refetch),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.line_style),
              onPressed: () => launchUrl('https://baidu.com'),
            ),
            bottomNavigationBar: BottomNavigationBarWidget(),
          );
        });
  }
}

class TaskList extends StatelessWidget {
  final posts;
  final refetch;

  TaskList(this.posts, this.refetch);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length as int,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final post = posts[index];

        return Container(
          height: 50,
          child: Center(child: Text(post['title'] as String)),
        );
      },
    );
  }
}
