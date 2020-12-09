import 'package:flutter/material.dart';
import 'routes/routes.dart';
// import 'shared/firebase/init_firebase_crashlytics.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Future<void> _initializeFlutterFireFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   _initializeFlutterFireFuture = initializeFlutterFire();
  // }

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
