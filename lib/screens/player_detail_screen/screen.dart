import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_app/repositories/repositories.dart';
import 'package:blog_app/blocs/blocs.dart';
import 'package:blog_app/models/models.dart';

import 'view.dart';

class PlayerDetailScreen extends StatelessWidget {
  final playerRepository = PlayerRepository();

  PlayerDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = ModalRoute.of(context).settings.arguments as Player;

    return BlocProvider(
      create: (context) => PlayerControllerBloc(),
      child: BlocBuilder<PlayerControllerBloc, PlayerControllerState>(
        builder: (context, state) {
          return PlayerDetailView(player: player);
        },
      ),
    );
  }
}
