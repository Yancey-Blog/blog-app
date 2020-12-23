import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'package:blog_app/screens/screens.dart';

import './widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarBloc(),
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: Color.fromRGBO(29, 21, 54, 1),
            // bottomNavigationBar: BottomNavigationBars(),
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                IndexedStack(
                  index:
                      (state is CurrentIndexChanged) ? state.currentIndex : 0,
                  children: <Widget>[
                    MusicScreen(),
                    LoginScreen(),
                    PostListScreen(),
                  ],
                ),
                Positioned(
                  bottom: 36,
                  child: BottomNavigationBarWidget(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
