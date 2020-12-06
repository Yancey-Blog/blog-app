part of 'music_bloc.dart';

abstract class MusicState extends Equatable {
  const MusicState();
  
  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {}
