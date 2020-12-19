part of 'music_bloc.dart';

@immutable
abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class BestAlbumRequested extends MusicEvent {
  @override
  List<Object> get props => [];
}

class PlayerRequested extends MusicEvent {
  @override
  List<Object> get props => [];
}
