import 'package:equatable/equatable.dart';
import '../blocs.dart';
import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_addTask);
    on<CompleteTask>(_toggleCompleteTask);
    on<ToggleFavoriteTask>(_toggleFavoriteTask);
    on<ArchiveTask>(_archiveTask);
    on<DeleteTask>(_deleteTask);
  }

  void _addTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final pendingTasks = List<Task>.from(state.pendingTasks)
      ..insert(0, event.task);

    emit(state.copyWith(pendingTasks: pendingTasks));
  }

  void _toggleCompleteTask(CompleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final pendingTasks = List<Task>.from(state.pendingTasks);
    final completedTasks = List<Task>.from(state.completedTasks);

    if (!task.isCompleted) {
      pendingTasks.removeWhere((d) => d.id == task.id);
      completedTasks.insert(0, task.copyWith(isCompleted: true));
    } else {
      pendingTasks.insert(0, task.copyWith(isCompleted: false));
      completedTasks.removeWhere((d) => d.id == task.id);
    }

    emit(state.copyWith(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
    ));
  }

  void _toggleFavoriteTask(ToggleFavoriteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    final pendingTasks = List<Task>.from(state.pendingTasks)
        .map((d) =>
            d.id == task.id ? task.copyWith(isFavorite: !task.isFavorite) : d)
        .toList();
    final favoriteTasks = List<Task>.from(state.favoriteTasks);

    if (!task.isFavorite) {
      favoriteTasks.insert(0, task.copyWith(isFavorite: true));
    } else {
      favoriteTasks.removeWhere((d) => d.id == task.id);
    }

    emit(state.copyWith(
      pendingTasks: pendingTasks,
      favoriteTasks: favoriteTasks,
    ));
  }

  void _archiveTask(ArchiveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final pendingTasks = List<Task>.from(state.pendingTasks)
      ..removeWhere((d) => d.id == task.id);
    final completedTasks = List<Task>.from(state.completedTasks)
      ..removeWhere((d) => d.id == task.id);
    final archivedTasks = List<Task>.from(state.archivedTasks)
      ..add(task.copyWith(isArchived: true));

    emit(state.copyWith(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      archivedTasks: archivedTasks,
    ));
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final archivedTasks = List<Task>.from(state.archivedTasks)
      ..removeWhere((d) => d.id == task.id);

    emit(state.copyWith(archivedTasks: archivedTasks));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
