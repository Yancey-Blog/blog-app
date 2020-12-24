import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/repositories/repositories.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'view.dart';

class MusicScreen extends StatelessWidget {
  final playerRepository = PlayerRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicBloc(playerRepository: playerRepository),
      child: MusicView(),
    );
  }
}
