import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final bool isDone;
  final bool isArchived;

  const Task({
    required this.id,
    required this.title,
    this.isDone = false,
    this.isArchived = false,
  });

  @override
  List<Object?> get props => [id, title, isDone, isArchived];

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
    bool? isArchived,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isDone': isDone,
      'isArchived': isArchived,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
      isArchived: map['isArchived'] as bool,
    );
  }
}
