// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
  }

  void _addTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final tasks = List<Task>.from(state.tasks)..add(event.task);

    emit(TaskState(tasks: tasks));
  }

  void _updateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final tasks = List<Task>.from(state.tasks)
        .map((Task d) =>
            d.id == task.id ? task.copyWith(isDone: !task.isDone) : d)
        .toList();

    emit(TaskState(tasks: tasks));
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final tasks = List<Task>.from(state.tasks)
      ..removeWhere((d) => d.id == task.id);

    emit(TaskState(tasks: tasks));
  }
}
