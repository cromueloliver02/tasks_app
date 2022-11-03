part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> archivedTasks;

  const TaskState({
    this.pendingTasks = const [],
    this.completedTasks = const [],
    this.archivedTasks = const [],
  });

  @override
  List<Object> get props => [pendingTasks, archivedTasks, completedTasks];

  TaskState copyWith({
    List<Task>? pendingTasks,
    List<Task>? completedTasks,
    List<Task>? archivedTasks,
  }) {
    return TaskState(
      pendingTasks: pendingTasks ?? this.pendingTasks,
      completedTasks: completedTasks ?? this.completedTasks,
      archivedTasks: archivedTasks ?? this.archivedTasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
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
      archivedTasks: List<Task>.from(
        (map['archivedTasks'] as List).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
