import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import '../screens/tabs_screen.dart';

class PendingScreen extends StatelessWidget {
  static const id = '${TabsScreen.id}/tasks';

  const PendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Chip(
            label: BlocSelector<TaskBloc, TaskState, List<Task>>(
              selector: (state) => state.pendingTasks,
              builder: (ctx, pendingTasks) =>
                  Text('Pending Tasks: ${pendingTasks.length}'),
            ),
          ),
        ),
        Expanded(
          child: BlocSelector<TaskBloc, TaskState, List<Task>>(
            selector: (state) => state.pendingTasks,
            builder: (ctx, pendingTasks) => TaskList(tasks: pendingTasks),
          ),
        ),
      ],
    );
  }
}
