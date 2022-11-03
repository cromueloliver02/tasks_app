// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();

  @override
  List<Object> get props => [];
}

class SwitchTabEvent extends TabEvent {
  final int index;

  const SwitchTabEvent({required this.index});

  @override
  List<Object> get props => [index];
}
