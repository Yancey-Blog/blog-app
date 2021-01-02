import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'package:blog_app/screens/screens.dart';

import 'widgets/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarBloc(),
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                IndexedStack(
                  index:
                      (state is CurrentIndexChanged) ? state.currentIndex : 0,
                  children: <Widget>[
                    HomeScreen(),
                    FavoriteScreen(),
                    MusicScreen(),
                    MeScreen(),
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
