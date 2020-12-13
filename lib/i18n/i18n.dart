import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:blog_app/generated/i18n.dart';

class I18nConfig {
  static final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    I18n.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final supportedLocales = I18n.delegate.supportedLocales;
  static final localeResolutionCallback =
      I18n.delegate.resolution(fallback: Locale('en', 'US'));
}
