// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(const TabInitial(currentIdx: 0)) {
    on<SwitchTabEvent>(_switchTab);
  }

  void _switchTab(SwitchTabEvent event, Emitter<TabState> emit) {
    final currentIdx = event.index;

    emit(TabState(currentIdx: currentIdx));
  }
}
