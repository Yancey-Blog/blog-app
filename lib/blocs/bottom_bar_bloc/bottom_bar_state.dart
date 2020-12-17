part of 'bottom_bar_bloc.dart';

@immutable
abstract class BottomBarState extends Equatable {
  const BottomBarState();

  @override
  List<Object> get props => [];
}

class BottomBarInitial extends BottomBarState {}

class CurrentIndexChanged extends BottomBarState {
  final int currentIndex;

  const CurrentIndexChanged({
    @required this.currentIndex,
  }) : assert(currentIndex != null);

  @override
  List<Object> get props => [currentIndex];
}
