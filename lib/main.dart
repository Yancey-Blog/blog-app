import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/firebase/init_firebase.dart';
import 'blocs/bloc_observer_bus.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  setBackgroundMessage();
  await flutterLocalNotificationsPluginHandler();
  await setForegroundNotificationPresentationOptionsHandler();

  runZonedGuarded(() {
    Bloc.observer = BlocObserverBus();
    runApp(App());
  }, (error, stackTrace) {
    recordAllError(error, stackTrace);
  });
}
