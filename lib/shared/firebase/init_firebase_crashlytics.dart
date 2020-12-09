import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// TODO: AFTER TESTING AND DELETE ME
// Toggle this to cause an async error to be thrown during initialization
// and to test that runZonedGuarded() catches the error
final _kShouldTestAsyncErrorOnInit = false;

// TODO: AFTER TESTING AND DELETE ME
// Toggle this for testing Crashlytics in your app locally.
final _kTestingCrashlytics = true;

// TODO: AFTER TESTING AND DELETE ME
Future<void> _testAsyncErrorOnInit() async {
  Future<void>.delayed(const Duration(seconds: 2), () {
    final list = <int>[];
    print(list[100]);
  });
}

// Define an async function to initialize FlutterFire
Future<void> initializeFlutterFire() async {
  // Wait for Firebase to initialize
  await Firebase.initializeApp();

  if (_kTestingCrashlytics) {
    // TODO: AFTER TESTING AND DELETE ME
    // Force enable crashlytics collection enabled if we're testing it.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    // Else only enable it in non-debug builds.
    // You could additionally extend this to allow users to opt-in.
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  // Pass all uncaught errors to Crashlytics.
  Function originalOnError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    // Forward to original handler.
    originalOnError(errorDetails);
  };

  // TODO: AFTER TESTING AND DELETE ME
  if (_kShouldTestAsyncErrorOnInit) {
    await _testAsyncErrorOnInit();
  }
}
