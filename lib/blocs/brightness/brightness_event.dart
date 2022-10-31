part of 'brightness_bloc.dart';

abstract class BrightnessEvent extends Equatable {
  const BrightnessEvent();

  @override
  List<Object> get props => [];
}

class SwitchBrightnessEvent extends BrightnessEvent {}
