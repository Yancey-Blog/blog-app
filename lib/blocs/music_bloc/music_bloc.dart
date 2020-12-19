import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/repositories/repositories.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final MusicRepository musicRepository;
  final PlayerRepository playerRepository;

  MusicBloc({
    @required this.musicRepository,
    @required this.playerRepository,
  })  : assert(musicRepository != null && playerRepository != null),
        super(MusicInitial());

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is MusicRequested) {
      yield MusicLoadInProgress();
      try {
        final bestAlbums = await musicRepository.fetchBestAlbums();
        yield MusicLoadSuccess(bestAlbums: bestAlbums);
      } catch (_, stackTrace) {
        yield MusicLoadFailure('$_ $stackTrace');
      }
    }
    if (event is PlayerRequested) {
      yield MusicLoadInProgress();
      try {
        final players = await playerRepository.fetchPlayers();
        yield PlayerLoadSuccess(players: players);
      } catch (_, stackTrace) {
        yield MusicLoadFailure('$_ $stackTrace');
      }
    }
  }
}
