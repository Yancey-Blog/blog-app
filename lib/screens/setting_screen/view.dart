import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'package:blog_app/generated/i18n.dart';

class SettingView extends StatefulWidget {
  SettingView({Key key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final _items = {
    Locale('zh', 'CN'): '简体中文',
    Locale('ja', 'JP'): '日本語',
    Locale('en', 'US'): 'English',
  };

  var currLanguage = Locale('zh', 'CN');

  @override
  void initState() {
    super.initState();

    BlocProvider.of<SettingBloc>(context).add(SwitchLanguageRequested());
  }

  void onLocaleChange(Locale locale) {
    I18n.onLocaleChanged(locale);

    setState(() {
      currLanguage = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          I18n.of(context).settings,
        ),
      ),
      body: ListView.separated(
        itemCount: _items.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (context, index) {
          return Container(
            height: 1,
            color: Colors.black12,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items.values.toList()[index]),
            leading: Radio(
              value: _items.keys.toList()[index],
              groupValue: currLanguage,
              onChanged: onLocaleChange,
            ),
          );
        },
      ),
    );
  }
}
