import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    BlocProvider.of<BottomBarBloc>(context)
        .add(BottomBarItemTapped(index: index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BottomBarBloc(),
        child: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_circle,
                size: 24,
              ),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.music_albums,
                size: 24,
              ),
              label: 'Music',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                size: 24,
              ),
              label: 'Sliver',
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          // type: BottomNavigationBarType.fixed,
        ));
  }
}
