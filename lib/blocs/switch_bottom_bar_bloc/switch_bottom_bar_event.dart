part of 'switch_bottom_bar_bloc.dart';

abstract class SwitchBottomBarEvent extends Equatable {
  const SwitchBottomBarEvent();

  @override
  List<Object> get props => [];
}

class SwitchBottomBarRequested extends SwitchBottomBarEvent {
  final int index;
  const SwitchBottomBarRequested({@required this.index})
      : assert(index != null);

  @override
  List<Object> get props => [index];
}
