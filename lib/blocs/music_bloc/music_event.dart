part of 'music_bloc.dart';

@immutable
abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class MusicRequested extends MusicEvent {
  @override
  List<Object> get props => [];
}