part of 'player_controller_bloc.dart';

abstract class PlayerControllerState extends Equatable {
  const PlayerControllerState();

  @override
  List<Object> get props => [];
}

class PlayerControllerInitial extends PlayerControllerState {}

class CurrentPlayedMusicChanged extends PlayerControllerState {
  final Player currentPlayedMusic;

  const CurrentPlayedMusicChanged({
    @required this.currentPlayedMusic,
  }) : assert(currentPlayedMusic != null);

  @override
  List<Object> get props => [currentPlayedMusic];
}
