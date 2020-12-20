part of 'player_controller_bloc.dart';

abstract class PlayerControllerEvent extends Equatable {
  const PlayerControllerEvent();

  @override
  List<Object> get props => [];
}


class MusicItemTapped extends PlayerControllerEvent {
  final Player music;
  const MusicItemTapped({@required this.music}) : assert(music != null);

  @override
  List<Object> get props => [music];
}
