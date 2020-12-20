import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  int currentIndex = 0;

  BottomBarBloc() : super(BottomBarInitial());

  @override
  Stream<BottomBarState> mapEventToState(
    BottomBarEvent event,
  ) async* {
    if (event is BottomBarItemTapped) {
      currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: currentIndex);
    }
  }
}
