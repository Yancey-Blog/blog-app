import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverBus extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    // print('bus 级别的 $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // print('bus 级别的 $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(stackTrace);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    // print('bus 级别的 $event');
    super.onEvent(bloc, event);
  }
}
