import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
    if (kDebugMode) {
      if (bloc is Cubit) print(change);
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) print(transition);
  }
}
