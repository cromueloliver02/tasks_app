part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class CompleteTask extends TaskEvent {
  final Task task;

  const CompleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class ToggleFavoriteTask extends TaskEvent {
  final Task task;

  const ToggleFavoriteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class ArchiveTask extends TaskEvent {
  final Task task;

  const ArchiveTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RestoreTask extends TaskEvent {
  final Task task;

  const RestoreTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class ClearArchive extends TaskEvent {}
