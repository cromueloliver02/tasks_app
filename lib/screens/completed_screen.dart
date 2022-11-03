import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/blocs.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/widgets/task_list.dart';
import '../screens/tabs_screen.dart';

class CompletedScreen extends StatelessWidget {
  static const id = '${TabsScreen.id}/completed';

  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Chip(
            label: BlocSelector<TaskBloc, TaskState, List<Task>>(
              selector: (state) => state.completedTasks,
              builder: (ctx, completedTasks) =>
                  Text('Completed Tasks: ${completedTasks.length}'),
            ),
          ),
        ),
        Expanded(
          child: BlocSelector<TaskBloc, TaskState, List<Task>>(
            selector: (state) => state.completedTasks,
            builder: (ctx, completedTasks) => TaskList(tasks: completedTasks),
          ),
        ),
      ],
    );
  }
}
