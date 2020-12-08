import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/repositories/repositories.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'view.dart';

class MusicScreen extends StatelessWidget {
  final MusicRepository musicRepository;

  MusicScreen({Key key, @required this.musicRepository})
      : assert(musicRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicBloc(
        musicRepository: musicRepository,
      ),
      child: MusicView(),
    );
  }
}
