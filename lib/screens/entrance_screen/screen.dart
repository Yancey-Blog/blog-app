import 'package:flutter/material.dart';
import 'package:blog_app/routes/routes.dart';

class EntranceScreen extends StatelessWidget {
  final routes = Routes.routes;

  EntranceScreen({Key key}) : super(key: key);

  void onTapped(BuildContext context, String path) {
    Navigator.pushNamed(
      context,
      path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrance Page'),
      ),
      body: ListView.separated(
        itemCount: routes.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (context, index) {
          return Container(
            height: 1,
            color: Colors.black12,
          );
        },
        itemBuilder: (context, index) {
          final _routes = routes.keys.toList();
          return ListTile(
            title: Text(_routes[index]),
            onTap: () => onTapped(context, _routes[index]),
          );
        },
      ),
    );
  }
}
