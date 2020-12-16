import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'package:blog_app/widgets/bottom_navigation_bar.dart';
import 'package:blog_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchBottomBarBloc(),
      child: BlocBuilder<SwitchBottomBarBloc, SwitchBottomBarState>(
        builder: (context, state) {
          Widget _currBody = PostListScreen();

          if (state is SwitchBottomBarSuccess) {
            if (state.index == 0) {
              _currBody = PostListScreen();
              ;
            }

            if (state.index == 1) {
              _currBody = BatteryScreen();
            }

            if (state.index == 2) {
              _currBody = DeviceInfoScreen();
            }
            return Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(),
              body: _currBody,
            );
          } else {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(),
              body: _currBody,
            );
          }
        },
      ),
    );
  }
}
