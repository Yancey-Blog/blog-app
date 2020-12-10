import 'package:flutter/material.dart';

import 'package:blog_app/shared/firebase/init_firebase.dart';

class FirebaseAnalyticsScreen extends StatelessWidget {
  FirebaseAnalyticsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Analytics'),
      ),
      body: RaisedButton(
        child: const Text('Send Analytics'),
        onPressed: collectAnalytics,
      ),
    );
  }
}
