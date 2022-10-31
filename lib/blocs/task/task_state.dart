// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  final List<Task> archivedTasks;

  const TaskState({
    this.tasks = const [],
    this.archivedTasks = const [],
  });

  @override
  List<Object> get props => [tasks, archivedTasks];

  TaskState copyWith({
    List<Task>? tasks,
    List<Task>? archivedTasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      archivedTasks: archivedTasks ?? this.archivedTasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tasks': tasks.map((x) => x.toMap()).toList(),
      'archivedTasks': archivedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      tasks: List<Task>.from(
        (map['tasks'] as List<dynamic>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      archivedTasks: List<Task>.from(
        (map['archivedTasks'] as List<dynamic>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
