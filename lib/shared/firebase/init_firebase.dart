import 'package:firebase_core/firebase_core.dart';

export 'init_firebase_analytics.dart';
export 'init_firebase_crashlytics.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}
