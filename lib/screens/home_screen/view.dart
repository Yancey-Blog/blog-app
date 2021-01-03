import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/blocs/blocs.dart';

import 'widgets/search_input.dart';
import 'widgets/daily_recommend_list.dart';
import 'widgets/recent_list.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostBloc>(context).add(PostListRequested(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        Widget _renderedWidget1 = SizedBox();
        Widget _renderedWidget2 = SizedBox();

        if (state is PostLoadInProgress) {
          _renderedWidget1 = Center(
            child: CircularProgressIndicator(),
          );
          _renderedWidget2 = Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PostListLoadSuccess) {
          final posts = state.posts;
          _renderedWidget1 = DailyRecommendList(posts: posts);
          _renderedWidget2 = RecentList(posts: posts);
        }

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchInput(),
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 12),
                    child: Text(
                      'Blogs for you',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  _renderedWidget1,
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 12),
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Show All',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffe95a7d),
                          ),
                        )
                      ],
                    ),
                  ),
                  _renderedWidget2,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
