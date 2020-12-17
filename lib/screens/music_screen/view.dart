import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

import 'widgets/player.dart';

class MusicView extends StatefulWidget {
  MusicView({Key key}) : super(key: key);

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<MusicBloc>(context).add(MusicRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(
      builder: (context, state) {
        Widget _renderedWidget = Container();

        if (state is MusicLoadInProgress) {
          _renderedWidget = Center(child: CircularProgressIndicator());
        }

        if (state is MusicLoadSuccess) {
          final bestAlbums = state.bestAlbums;

          _renderedWidget = ListView.builder(
            itemCount: bestAlbums.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final bestAlbum = bestAlbums[index];

              return ListTile(
                title: Text(bestAlbum.title),
                subtitle: Text(bestAlbum.artist),
              );
            },
          );
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
          // body: _renderedWidget,
          body: Player(),
        );
      },
    );
  }
}
