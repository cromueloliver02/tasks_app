import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isDone;
  final bool isArchived;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
    this.isArchived = false,
  });

  @override
  List<Object?> get props => [id, title, description, isDone, isArchived];

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    bool? isArchived,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'isArchived': isArchived,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
      isArchived: map['isArchived'] as bool,
    );
  }
}
