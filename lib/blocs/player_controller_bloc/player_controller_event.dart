part of 'player_controller_bloc.dart';

abstract class PlayerControllerEvent extends Equatable {
  const PlayerControllerEvent();

  @override
  List<Object> get props => [];
}

class AudioPlayed extends PlayerControllerEvent {
  final Player audio;
  const AudioPlayed({@required this.audio}) : assert(audio != null);

  @override
  List<Object> get props => [audio];
}

class AudioPaused extends PlayerControllerEvent {
  @override
  List<Object> get props => [];
}
