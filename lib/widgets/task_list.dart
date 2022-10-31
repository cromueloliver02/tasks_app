import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, idx) {
        final task = tasks[idx];

        return ListTile(
          title: Text(task.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: (value) =>
                    context.read<TaskBloc>().add(UpdateTask(task: task)),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                iconSize: 30,
                onPressed: () =>
                    context.read<TaskBloc>().add(DeleteTask(task: task)),
              ),
            ],
          ),
        );
      },
    );
  }
}
