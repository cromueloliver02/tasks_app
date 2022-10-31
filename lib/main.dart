import 'package:flutter/material.dart';
import 'tasks_app.dart';
import 'blocs/blocs.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(const TasksApp());
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) debugPrint(change.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(transition.toString());
  }
}
