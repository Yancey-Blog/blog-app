import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'shared/firebase/init_firebase.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final firebaseAnalyticsObserver = FirebaseAnalyticsInitial.observer;

  @override
  void initState() {
    super.initState();
    initializeFirebaseCrashlytics();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
      navigatorObservers: <NavigatorObserver>[firebaseAnalyticsObserver],
    );
  }
}
