import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Poster extends StatefulWidget {
  final String cover;

  Poster({Key key, @required this.cover}) : super(key: key);

  @override
  _PosterState createState() => _PosterState();
}

class _PosterState extends State<Poster> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: false);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.193),
          width: MediaQuery.of(context).size.width * 0.825,
          height: MediaQuery.of(context).size.width * 0.825,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://s3.music.126.net/mobile-new/img/disc-plus.png',
              ),
            ),
          ),
          child: RotationTransition(
            turns: _animation,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.825,
              height: MediaQuery.of(context).size.width * 0.825,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://s3.music.126.net/mobile-new/img/disc_light-plus.png',
                  ),
                ),
              ),
              child: Center(
                child: ClipOval(
                  child: Image.network(
                    widget.cover,
                    width: MediaQuery.of(context).size.width * 0.517,
                    height: MediaQuery.of(context).size.width * 0.517,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width * 0.265,
          height: MediaQuery.of(context).size.width * 0.383,
          top: 0,
          left: MediaQuery.of(context).size.width * 0.362,
          child: Image.network(
            'https://s3.music.126.net/mobile-new/img/needle-plus.png?994aa910ce3e4d242eb7076620b0e502=',
          ),
        )
      ],
    );
  }
}
