import 'package:flutter/material.dart';
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
          const AddTask(task: Task(title: 'Task 1')),
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
