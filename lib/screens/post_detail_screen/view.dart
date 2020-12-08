import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'components/custom_markdown_component/view.dart';

class PostDetailView extends StatefulWidget {
  final String id;

  PostDetailView({Key key, @required this.id}) : super(key: key);

  @override
  _PostDetailViewState createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostDetailBloc>(context).add(
      PostDetailRequested(id: widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailBloc, PostDetailState>(
      builder: (context, state) {
        if (state is PostDetailInitial) {
          return Center(child: Text('Please Select a Location'));
        }

        if (state is PostDetailLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PostDetailLoadSuccess) {
          final post = state.post;

          return Scaffold(
            appBar: AppBar(
              title: Text(post.title),
            ),
            body: SafeArea(
              child: CustomMarkdown(post.content),
            ),
          );
        }

        if (state is PostDetailLoadFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
