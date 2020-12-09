import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'blocs/bloc_observer_bus.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    Bloc.observer = BlocObserverBus();
    runApp(App());
  }, (error, stackTrace) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
