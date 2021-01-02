import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: '搜索电影、电视剧、演员',
            ),
          ),
        ],
      ),
    );
  }
}
