import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import 'screens/tasks_screen.dart';

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TaskBloc()
        ..add(
          AddTask(
            task: Task(
              id: const Uuid().v1(),
              title: 'Task 1',
            ),
          ),
        ),
      child: MaterialApp(
        title: 'Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
