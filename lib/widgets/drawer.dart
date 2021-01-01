import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final bool show;
  final Widget child;

  const CustomDrawer({
    Key key,
    @required this.show,
    @required this.child,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with TickerProviderStateMixin {
  AnimationController controller;
  Tween<Offset> tween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        milliseconds: 200,
      ),
      vsync: this,
    );

    tween = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.show) {
      controller.forward();
    } else {
      controller.reverse();
    }

    return SlideTransition(
      position: tween.animate(controller),
      child: widget.child,
    );
  }
}
