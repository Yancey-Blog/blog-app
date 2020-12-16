part of 'switch_bottom_bar_bloc.dart';

@immutable
abstract class SwitchBottomBarState extends Equatable {
  const SwitchBottomBarState();

  @override
  List<Object> get props => [];
}

class SwitchBottomBarInitial extends SwitchBottomBarState {}

class SwitchBottomBarSuccess extends SwitchBottomBarState {
  final int index;

  const SwitchBottomBarSuccess({@required this.index}) : assert(index != null);

  @override
  List<Object> get props => [index];
}
