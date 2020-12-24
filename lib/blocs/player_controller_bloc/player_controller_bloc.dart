import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    if (event is AudioPlayed) {
      yield AudioLoadInProgress();
      yield AudioPlaySuccess();

      if (event is AudioPaused) {
        yield AudioPauseSuccess();
      }
    }
  }
}
