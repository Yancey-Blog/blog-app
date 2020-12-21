import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/repositories/repositories.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'view.dart';

class MusicScreen extends StatelessWidget {
  final bestAlbumRepository = BestAlbumRepository();
  final playerRepository = PlayerRepository();

  MusicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MusicBloc>(
          create: (context) => MusicBloc(
            bestAlbumRepository: bestAlbumRepository,
            playerRepository: playerRepository,
          ),
        ),
        BlocProvider<PlayerControllerBloc>(
          create: (BuildContext context) => PlayerControllerBloc(),
        ),
      ],
      child: MusicView(),
    );
  }
}
