import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CustomMarkdown extends StatelessWidget {
  final String content;

  CustomMarkdown(this.content);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: content,
      styleSheet: MarkdownStyleSheet(
        h1: TextStyle(color: Colors.blue, fontSize: 40),
      ),
    );
  }
}
