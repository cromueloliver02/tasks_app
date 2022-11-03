part of 'tab_bloc.dart';

class TabState extends Equatable {
  final int currentIdx;

  const TabState({required this.currentIdx});

  @override
  List<Object> get props => [currentIdx];
}

class TabInitial extends TabState {
  const TabInitial({required super.currentIdx});

  @override
  List<Object> get props => [currentIdx];
}
