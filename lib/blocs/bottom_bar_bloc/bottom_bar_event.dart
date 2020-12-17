part of 'bottom_bar_bloc.dart';

abstract class BottomBarEvent extends Equatable {
  const BottomBarEvent();

  @override
  List<Object> get props => [];
}

class BottomBarItemTapped extends BottomBarEvent {
  final int index;
  const BottomBarItemTapped({@required this.index}) : assert(index != null);

  @override
  List<Object> get props => [index];
}
