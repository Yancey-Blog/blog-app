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
          return Scaffold(
            bottomNavigationBar: BottomNavigationBarWidget(),
            body: IndexedStack(
              index: (state is CurrentIndexChanged) ? state.currentIndex : 0,
              children: <Widget>[
                LoginScreen(),
                BatteryScreen(),
                DeviceInfoScreen()
              ],
            ),
          );
        },
      ),
    );
  }
}
