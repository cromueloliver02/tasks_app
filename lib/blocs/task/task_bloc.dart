// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_app/models/task.dart';

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

    emit(TaskState(
      tasks: List.from(state.tasks)..add(event.task),
    ));
  }

  void _updateTask(UpdateTask event, Emitter<TaskState> emit) {}

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit) {}
}
