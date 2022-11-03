import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';

class TaskTilePopMenu extends StatelessWidget {
  const TaskTilePopMenu({
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
    return PopupMenuButton(
      itemBuilder: (ctx) => !task.isArchived
          ? [
              PopupMenuItem(
                onTap: () {},
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                ),
              ),
              PopupMenuItem(
                onTap: () => context
                    .read<TaskBloc>()
                    .add(ToggleFavoriteTask(task: task)),
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.bookmark_add),
                  label: Text(
                      '${task.isFavorite ? 'Remove from' : 'Add to'} Bookmark'),
                ),
              ),
              PopupMenuItem(
                onTap: () => _onArchiveOrDelete(context),
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.delete),
                  label: const Text('Archive'),
                ),
              ),
            ]
          : [
              PopupMenuItem(
                onTap: () {},
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.restore),
                  label: const Text('Restore'),
                ),
              ),
              PopupMenuItem(
                onTap: () => _onArchiveOrDelete(context),
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.delete_forever),
                  label: const Text('Delete'),
                ),
              ),
            ],
    );
  }
}
