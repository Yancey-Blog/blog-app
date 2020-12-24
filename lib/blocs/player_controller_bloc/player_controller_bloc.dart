import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:blog_app/models/models.dart';
import 'package:blog_app/repositories/repositories.dart';

part 'player_controller_event.dart';
part 'player_controller_state.dart';

class PlayerControllerBloc
    extends Bloc<PlayerControllerEvent, PlayerControllerState> {
  final PlayerControllerRepository playerControllerRepository;

  PlayerControllerBloc({
    this.playerControllerRepository,
  }) : super(PlayerControllerInitial());

  @override
  Stream<PlayerControllerState> mapEventToState(
    PlayerControllerEvent event,
  ) async* {
    if (event is AudioPlayed) {
      yield AudioLoadInProgress();

      try {
        await playerControllerRepository.play(event.audio.musicFileUrl);
        yield AudioPlaySuccess();
      } catch (_, stackTrace) {
        yield AudioLoadFailure('$_ $stackTrace');
      }

      if (event is AudioPaused) {
        yield AudioPauseSuccess();
      }
    }
  }
}
