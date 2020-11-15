import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql/apollo_client.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        child: MaterialApp(
          title: 'Flutter 💋 GraphQL',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: HomePage(),
        ),
        client: client);
  }
}
