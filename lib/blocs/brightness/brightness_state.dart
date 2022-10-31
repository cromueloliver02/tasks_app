part of 'brightness_bloc.dart';

class BrightnessState extends Equatable {
  final bool isDark;

  const BrightnessState({required this.isDark});

  @override
  List<Object> get props => [isDark];

  BrightnessState copyWith({
    bool? isDark,
  }) {
    return BrightnessState(
      isDark: isDark ?? this.isDark,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isDark': isDark,
    };
  }

  factory BrightnessState.fromMap(Map<String, dynamic> map) {
    return BrightnessState(
      isDark: map['isDark'] as bool,
    );
  }
}

class BrightnessInitial extends BrightnessState {
  const BrightnessInitial({required super.isDark});
}
