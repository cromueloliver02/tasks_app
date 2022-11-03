import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import '../widgets/task_tile_pop.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.jm().add_yMMMd().format(task.dateTime);

    return ListTile(
      leading: !task.isArchived
          ? Checkbox(
              value: task.isDone,
              onChanged: (value) =>
                  context.read<TaskBloc>().add(CompleteTask(task: task)),
            )
          : null,
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration:
              task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(date),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          ),
          TaskTilePopMenu(task: task),
        ],
      ),
    );
  }
}
