import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'switch_bottom_bar_event.dart';
part 'switch_bottom_bar_state.dart';

class SwitchBottomBarBloc
    extends Bloc<SwitchBottomBarEvent, SwitchBottomBarState> {
  SwitchBottomBarBloc() : super(SwitchBottomBarInitial());

  @override
  Stream<SwitchBottomBarState> mapEventToState(
    SwitchBottomBarEvent event,
  ) async* {
    if (event is SwitchBottomBarRequested) {
      final index = event.index;

      yield SwitchBottomBarSuccess(index: index);
    }
  }
}
