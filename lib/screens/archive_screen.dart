import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import '../widgets/task_drawer.dart';
import '../widgets/task_list.dart';

class ArchiveScreen extends StatelessWidget {
  static const id = '/archive';

  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Tasks'),
      ),
      drawer: const TaskDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: BlocSelector<TaskBloc, TaskState, List<Task>>(
                selector: (state) => state.archivedTasks,
                builder: (context, archivedTasks) {
                  return Text('Archived Tasks: ${archivedTasks.length}');
                },
              ),
            ),
          ),
          Expanded(
            child: BlocSelector<TaskBloc, TaskState, List<Task>>(
              selector: (state) => state.archivedTasks,
              builder: (context, archivedTasks) {
                return TaskList(tasks: archivedTasks);
              },
            ),
          ),
        ],
      ),
    );
  }
}
