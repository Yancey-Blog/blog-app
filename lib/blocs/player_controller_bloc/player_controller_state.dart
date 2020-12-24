part of 'player_controller_bloc.dart';

abstract class PlayerControllerState extends Equatable {
  const PlayerControllerState();

  @override
  List<Object> get props => [];
}

class PlayerControllerInitial extends PlayerControllerState {}

class AudioLoadInProgress extends PlayerControllerState {}

class AudioPlaySuccess extends PlayerControllerState {
  @override
  List<Object> get props => [];
}

class AudioPauseSuccess extends PlayerControllerState {
  @override
  List<Object> get props => [];
}

class AudioLoadFailure extends PlayerControllerState {
  final String errorMessage;

  const AudioLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
