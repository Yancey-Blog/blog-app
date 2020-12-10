import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// Toggle this to cause an async error to be thrown during initialization
// and to test that runZonedGuarded() catches the error
final _kShouldTestAsyncErrorOnInit = false;

// Toggle this for testing Crashlytics in your app locally.
final _kTestingCrashlytics = true;

Future<void> _testAsyncErrorOnInit() async {
  Future<void>.delayed(const Duration(seconds: 2), () {
    final list = <int>[];
    print(list[100]);
  });
}

// Define an async function to initialize FlutterFire
Future<void> initializeFirebaseCrashlytics() async {
  if (_kTestingCrashlytics) {
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

  if (_kShouldTestAsyncErrorOnInit) {
    await _testAsyncErrorOnInit();
  }
}

// 线上版
// Future<void> initializeFirebaseCrashlytics() async {
//   await FirebaseCrashlytics.instance
//       .setCrashlyticsCollectionEnabled(!kDebugMode);

//   Function originalOnError = FlutterError.onError;
//   FlutterError.onError = (FlutterErrorDetails errorDetails) async {
//     await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
//     originalOnError(errorDetails);
//   };
// }

void recordAllError(Object error, StackTrace stackTrace) {
  FirebaseCrashlytics.instance.recordError(error, stackTrace);
}

void collectCrashlytics() {
  // key-value
  FirebaseCrashlytics.instance.setCustomKey('key', 'value');

  // string
  FirebaseCrashlytics.instance.log('传一段文字');

  // user identifier
  FirebaseCrashlytics.instance.setUserIdentifier('传一个用户唯一标识, 如 userId');

  // 强制让 app 崩溃, 可用于测试安装是否成功
  FirebaseCrashlytics.instance.crash();

  // 监控隔离区的崩溃
  // import 'dart:isolate';
  // Isolate.current.addErrorListener(RawReceivePort((pair) async {
  //   final List<dynamic> errorAndStacktrace = pair;
  //   await FirebaseCrashlytics.instance.recordError(
  //     errorAndStacktrace.first,
  //     errorAndStacktrace.last,
  //   );
  // }).sendPort);
}
