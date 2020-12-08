import 'package:flutter/material.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}
