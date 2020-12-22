import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final _list = [
    CupertinoIcons.person_circle,
    CupertinoIcons.music_albums,
    CupertinoIcons.home,
  ];

  void _onItemTapped(int index) {
    BlocProvider.of<BottomBarBloc>(context)
        .add(BottomBarItemTapped(index: index));
  }

  List<Widget> _renderIcon(BottomBarState state) {
    return _list.map(
      (el) {
        var index = _list.indexOf(el);
        return IconButton(
          icon: Icon(
            el,
            size: 24,
            color: Colors.red,
          ),
          onPressed: () => _onItemTapped(index),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarBloc(),
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.6432,
                height: 51,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  borderRadius: BorderRadius.all(Radius.circular(51)),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(51)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6432,
                    height: 51,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _renderIcon(state),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
