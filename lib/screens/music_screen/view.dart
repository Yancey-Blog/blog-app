import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/blocs/blocs.dart';

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
        if (state is MusicInitial) {
          return Center(child: Text('Please Select a Location'));
        }

        if (state is MusicLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is MusicLoadSuccess) {
          final bestAlbums = state.bestAlbums;

          return Scaffold(
            appBar: AppBar(
              title: Text('Music'),
            ),
            body: ListView.builder(
              itemCount: bestAlbums.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final bestAlbum = bestAlbums[index];

                return ListTile(
                  title: Text(bestAlbum.title),
                  subtitle: Text(bestAlbum.artist),
                );
              },
            ),
          );
        }

        if (state is MusicLoadFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
