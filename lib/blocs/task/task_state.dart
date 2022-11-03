part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> archivedTasks;

  const TaskState({
    this.pendingTasks = const [],
    this.completedTasks = const [],
    this.favoriteTasks = const [],
    this.archivedTasks = const [],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        completedTasks,
        favoriteTasks,
        archivedTasks,
      ];

  TaskState copyWith({
    List<Task>? pendingTasks,
    List<Task>? completedTasks,
    List<Task>? favoriteTasks,
    List<Task>? archivedTasks,
  }) {
    return TaskState(
      pendingTasks: pendingTasks ?? this.pendingTasks,
      completedTasks: completedTasks ?? this.completedTasks,
      favoriteTasks: favoriteTasks ?? this.favoriteTasks,
      archivedTasks: archivedTasks ?? this.archivedTasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'archivedTasks': archivedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks: List<Task>.from(
        (map['pendingTasks'] as List).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks'] as List).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      favoriteTasks: List<Task>.from(
        (map['favoriteTasks'] as List).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      archivedTasks: List<Task>.from(
        (map['archivedTasks'] as List).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
