import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import '../screens/tasks_screen.dart';
import '../screens/archive_screen.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.folder_special_rounded),
              title: const Text('My Tasks'),
              trailing: BlocSelector<TaskBloc, TaskState, List<Task>>(
                selector: (state) => state.tasks,
                builder: (ctx, tasks) => Text('${tasks.length}'),
              ),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                TasksScreen.id,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Archive'),
              trailing: BlocSelector<TaskBloc, TaskState, List<Task>>(
                selector: (state) => state.archivedTasks,
                builder: (context, archivedTasks) {
                  return Text('${archivedTasks.length}');
                },
              ),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                ArchiveScreen.id,
              ),
            ),
            const SizedBox(height: 30),
            BlocSelector<BrightnessBloc, BrightnessState, bool>(
              selector: (state) => state.isDark,
              builder: (ctx, isDark) => Switch(
                value: isDark,
                onChanged: (value) =>
                    ctx.read<BrightnessBloc>().add(SwitchBrightnessEvent()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
