import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _onArchiveOrDelete(BuildContext ctx) {
    final taskBloc = ctx.read<TaskBloc>();

    if (!task.isArchived) {
      taskBloc.add(ArchiveTask(task: task));
    } else {
      taskBloc.add(DeleteTask(task: task));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
              task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
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
            onPressed: () => _onArchiveOrDelete(context),
          ),
        ],
      ),
    );
  }
}
