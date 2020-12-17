import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'package:blog_app/widgets/bottom_navigation_bar.dart';
import 'package:blog_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarBloc(),
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          Widget _currBody = PostListScreen();

          if (state is CurrentIndexChanged) {
            if (state.currentIndex == 0) {
              _currBody = PostListScreen();
            }

            if (state.currentIndex == 1) {
              _currBody = BatteryScreen();
            }

            if (state.currentIndex == 2) {
              _currBody = DeviceInfoScreen();
            }
          }

          return Scaffold(
            bottomNavigationBar: BottomNavigationBarWidget(),
            body: _currBody,
          );
        },
      ),
    );
  }
}
