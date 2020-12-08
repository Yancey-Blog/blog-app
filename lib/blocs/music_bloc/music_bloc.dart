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

  MusicBloc({@required this.musicRepository})
      : assert(musicRepository != null),
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
  }
}
