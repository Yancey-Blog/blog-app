import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql/apollo_client.dart';
import 'screens/screens.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          home: Navigator(
            pages: [
              MaterialPage(
                key: ValueKey('HomePage'),
                child: HomePage(),
              ),
              MaterialPage(
                key: ValueKey('PostDetailPage'),
                child: PostDetailPage(),
              )
            ],
            onPopPage: (route, result) => route.didPop(result),
          ),
        ),
      ),
    );
  }
}
