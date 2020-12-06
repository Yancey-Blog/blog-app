import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql/apollo_client.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: apolloClient,
      child: CacheProvider(
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          initialRoute: '/',
          routes: Routes.routes,
        ),
      ),
    );
  }
}
