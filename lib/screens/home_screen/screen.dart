import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'package:blog_app/widgets/bottom_navigation_bar.dart';
import 'package:blog_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  Widget _renderScreen(int index) {
    switch (index) {
      case 0:
        return MusicScreen();
      case 1:
        return BatteryScreen();
      case 2:
        return DeviceInfoScreen();
      default:
        return MusicScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarBloc(),
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          Widget _currentTabWidget = MusicScreen();

          if (state is CurrentIndexChanged) {
            _currentTabWidget = _renderScreen(state.currentIndex);
          }

          return Scaffold(
            bottomNavigationBar: BottomNavigationBarWidget(),
            body: _currentTabWidget,
          );
        },
      ),
    );
  }
}
