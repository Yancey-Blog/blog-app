part of 'music_bloc.dart';

@immutable
abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {}

class MusicLoadInProgress extends MusicState {}

class MusicLoadSuccess extends MusicState {
  final List<BestAlbum> bestAlbums;

  const MusicLoadSuccess({@required this.bestAlbums})
      : assert(bestAlbums != null);

  @override
  List<Object> get props => [bestAlbums];
}

class MusicLoadFailure extends MusicState {
  final String errorMessage;

  const MusicLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
