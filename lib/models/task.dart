import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final bool isCompleted;
  final bool isFavorite;
  final bool isArchived;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isCompleted = false,
    this.isFavorite = false,
    this.isArchived = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        dateTime,
        isCompleted,
        isFavorite,
        isArchived,
      ];

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dateTime,
    bool? isCompleted,
    bool? isFavorite,
    bool? isArchived,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      isCompleted: isCompleted ?? this.isCompleted,
      isFavorite: isFavorite ?? this.isFavorite,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isCompleted': isCompleted,
      'isFavorite': isFavorite,
      'isArchived': isArchived,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      isCompleted: map['isCompleted'] as bool,
      isFavorite: map['isFavorite'] as bool,
      isArchived: map['isArchived'] as bool,
    );
  }
}
