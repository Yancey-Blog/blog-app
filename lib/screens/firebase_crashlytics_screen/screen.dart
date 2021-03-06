import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'package:blog_app/shared/firebase/init_firebase_crashlytics.dart';

class FirebaseCrashlyticsScreen extends StatefulWidget {
  @override
  _FirebaseCrashlyticsScreenState createState() =>
      _FirebaseCrashlyticsScreenState();
}

class _FirebaseCrashlyticsScreenState extends State<FirebaseCrashlyticsScreen> {
  Future<void> _initializeFirebaseCrashlytics;

  @override
  void initState() {
    super.initState();
    _initializeFirebaseCrashlytics = initializeFirebaseCrashlytics();
  }

  void collectCrashlytics() {
    // key-value
    FirebaseCrashlytics.instance.setCustomKey('str_key', 'hello');

    // string
    FirebaseCrashlytics.instance.log('奶子疼');

    // user identifier
    FirebaseCrashlytics.instance.setUserIdentifier('userId');

    // 强制让 app 崩溃, 可用于测试安装是否成功
    FirebaseCrashlytics.instance.crash();

    // 监控隔离区的
    // Isolate.current.addErrorListener(RawReceivePort((pair) async {
    //   final List<dynamic> errorAndStacktrace = pair;
    //   await FirebaseCrashlytics.instance.recordError(
    //     errorAndStacktrace.first,
    //     errorAndStacktrace.last,
    //   );
    // }).sendPort);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crashlytics example app'),
        ),
        body: FutureBuilder(
          future: _initializeFirebaseCrashlytics,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                return Center(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                          child: const Text('Key'),
                          onPressed: () {
                            FirebaseCrashlytics.instance
                                .setCustomKey('key', '叫爸爸叫爸爸');
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Custom Key "example: flutterfire" has been set \n'
                                  'Key will appear in Firebase Console once app has crashed and reopened'),
                              duration: Duration(seconds: 5),
                            ));
                          }),
                      RaisedButton(
                          child: const Text('Log'),
                          onPressed: () {
                            FirebaseCrashlytics.instance
                                .log('This is a log example');
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'The message "This is a log example" has been logged \n'
                                  'Message will appear in Firebase Console once app has crashed and reopened'),
                              duration: Duration(seconds: 5),
                            ));
                          }),
                      RaisedButton(
                          child: const Text('Crash'),
                          onPressed: () async {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('App will crash is 5 seconds \n'
                                  'Please reopen to send data to Crashlytics'),
                              duration: Duration(seconds: 5),
                            ));

                            // Delay crash for 5 seconds
                            sleep(const Duration(seconds: 5));

                            // Use FirebaseCrashlytics to throw an error. Use this for
                            // confirmation that errors are being correctly reported.
                            FirebaseCrashlytics.instance.crash();
                          }),
                      RaisedButton(
                          child: const Text('Throw Error'),
                          onPressed: () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Thrown error has been caught \n'
                                  'Please crash and reopen to send data to Crashlytics'),
                              duration: Duration(seconds: 5),
                            ));

                            // Example of thrown error, it will be caught and sent to
                            // Crashlytics.
                            throw StateError('Uncaught error thrown by app');
                          }),
                      RaisedButton(
                          child: const Text('Async out of bounds'),
                          onPressed: () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Uncaught Exception that is handled by second parameter of runZonedGuarded \n'
                                  'Please crash and reopen to send data to Crashlytics'),
                              duration: Duration(seconds: 5),
                            ));

                            // Example of an exception that does not get caught
                            // by `FlutterError.onError` but is caught by
                            // `runZonedGuarded`.
                            runZonedGuarded(() {
                              Future<void>.delayed(const Duration(seconds: 2),
                                  () {
                                final list = <int>[];
                                print(list[100]);
                              });
                            }, FirebaseCrashlytics.instance.recordError);
                          }),
                      RaisedButton(
                          child: const Text('Record Error'),
                          onPressed: () async {
                            try {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Recorded Error  \n'
                                    'Please crash and reopen to send data to Crashlytics'),
                                duration: Duration(seconds: 5),
                              ));
                              throw 'error_example';
                            } catch (e, s) {
                              // "reason" will append the word "thrown" in the
                              // Crashlytics console.
                              await FirebaseCrashlytics.instance
                                  .recordError(e, s, reason: 'as an example');
                            }
                          }),
                      RaisedButton(
                          child: const Text('关闭错误自动上报'),
                          onPressed: () {
                            FirebaseCrashlytics.instance
                                .setCrashlyticsCollectionEnabled(false);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('关了关了行了吧'),
                              duration: Duration(seconds: 5),
                            ));
                          }),
                    ],
                  ),
                );
                break;
              default:
                return Center(child: Text('Loading'));
            }
          },
        ),
      ),
    );
  }
}
