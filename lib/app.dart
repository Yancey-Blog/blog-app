import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'generated/i18n.dart';
import 'i18n/i18n.dart';
import 'themes/light_theme.dart';
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
    I18n.onLocaleChanged = onLocaleChange;
    initializeFirebaseCrashlytics();
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      I18n.locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.lightTheme,
      localizationsDelegates: I18nConfig.localizationsDelegates,
      supportedLocales: I18nConfig.supportedLocales,
      localeResolutionCallback: I18nConfig.localeResolutionCallback,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
      navigatorObservers: <NavigatorObserver>[firebaseAnalyticsObserver],
      debugShowCheckedModeBanner: false,
    );
  }
}
