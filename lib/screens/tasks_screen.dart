import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_modal.dart';
import '../widgets/task_drawer.dart';

class TasksScreen extends StatelessWidget {
  static const id = '/tasks';

  const TasksScreen({Key? key}) : super(key: key);

  void _showAddTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (ctx) => const AddTaskModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            onPressed: () => _showAddTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const TaskDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: BlocSelector<TaskBloc, TaskState, List<Task>>(
                selector: (state) => state.tasks,
                builder: (context, tasks) => Text('Tasks: ${tasks.length}'),
              ),
            ),
          ),
          Expanded(
            child: BlocSelector<TaskBloc, TaskState, List<Task>>(
              selector: (state) => state.tasks,
              builder: (context, tasks) {
                return TaskList(tasks: tasks);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
