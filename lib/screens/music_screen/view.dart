import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'widgets/player_list.dart';

class MusicView extends StatefulWidget {
  MusicView({Key key}) : super(key: key);

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<MusicBloc>(context).add(PlayerRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(
      builder: (context, state) {
        Widget _renderedWidget;

        if (state is MusicLoadInProgress) {
          _renderedWidget = Center(child: CircularProgressIndicator());
        }

        if (state is PlayerLoadSuccess) {
          final players = state.players;
          _renderedWidget = PlayerList(players: players);
        }

        if (state is MusicLoadFailure) {
          _renderedWidget = Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        return Scaffold(
          backgroundColor: Color.fromRGBO(239, 245, 249, 1),
          body: _renderedWidget,
        );
      },
    );
  }
}
