import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:blog_app/models/models.dart';

part 'player_controller_event.dart';
part 'player_controller_state.dart';

class PlayerControllerBloc
    extends Bloc<PlayerControllerEvent, PlayerControllerState> {
  PlayerControllerBloc() : super(PlayerControllerInitial());

  @override
  Stream<PlayerControllerState> mapEventToState(
    PlayerControllerEvent event,
  ) async* {
    if (event is MusicItemTapped) {
      yield CurrentPlayedMusicChanged(currentPlayedMusic: event.music);
    }
  }
}
