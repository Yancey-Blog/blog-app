import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'components/custom_markdown_component/view.dart';

class PostDetailView extends StatefulWidget {
  final String id;

  PostDetailView({Key key, @required this.id}) : super(key: key);

  @override
  _PostDetailViewState createState() => _PostDetailViewState(id);
}

class _PostDetailViewState extends State<PostDetailView> {
  final String id;

  _PostDetailViewState(this.id);

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostBloc>(context).add(
      PostDetailRequested(id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        Widget _renderedWidget;

        if (state is PostLoadInProgress) {
          _renderedWidget = Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PostDetailLoadSuccess) {
          final post = state.post;

          _renderedWidget = SafeArea(
            child: CustomMarkdown(post.content),
          );
        }

        if (state is PostLoadFailure) {
          _renderedWidget = Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        return Scaffold(
          body: _renderedWidget,
        );
      },
    );
  }
}
