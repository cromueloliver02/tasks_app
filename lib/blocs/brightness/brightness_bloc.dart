import 'package:equatable/equatable.dart';
import '../blocs.dart';

part 'brightness_event.dart';
part 'brightness_state.dart';

class BrightnessBloc extends HydratedBloc<BrightnessEvent, BrightnessState> {
  BrightnessBloc() : super(const BrightnessInitial(isDark: false)) {
    on<SwitchBrightnessEvent>(_switchBrightness);
  }

  void _switchBrightness(
      SwitchBrightnessEvent event, Emitter<BrightnessState> emit) {
    final state = this.state;

    emit(state.copyWith(isDark: !state.isDark));
  }

  @override
  BrightnessState? fromJson(Map<String, dynamic> json) {
    return BrightnessState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BrightnessState state) {
    return state.toMap();
  }
}
