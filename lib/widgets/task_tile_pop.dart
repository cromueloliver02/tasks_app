import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import '../widgets/task_modal.dart';

class TaskTilePopMenu extends StatelessWidget {
  const TaskTilePopMenu({
    super.key,
    required this.task,
  });

  final Task task;

  void _onSelected(BuildContext ctx, ActionType actionType) {
    switch (actionType) {
      case ActionType.edit:
        _showEditTask(ctx);
        break;
      case ActionType.bookmark:
        ctx.read<TaskBloc>().add(ToggleFavoriteTask(task: task));
        break;
      case ActionType.archive:
        _onArchiveOrDelete(ctx);
        break;
      case ActionType.restore:
        ctx.read<TaskBloc>().add(RestoreTask(task: task));
        break;
      case ActionType.delete:
        _onArchiveOrDelete(ctx);
        break;
    }
  }

  void _onArchiveOrDelete(BuildContext ctx) {
    final taskBloc = ctx.read<TaskBloc>();

    if (!task.isArchived) {
      taskBloc.add(ArchiveTask(task: task));
    } else {
      taskBloc.add(DeleteTask(task: task));
    }
  }

  void _showEditTask(BuildContext ctx) => showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (ctx) => TaskModal(task: task),
      );

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ActionType>(
      onSelected: (actionType) => _onSelected(context, actionType),
      itemBuilder: (ctx) => !task.isArchived
          ? [
              PopupMenuItem(
                value: ActionType.edit,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                ),
              ),
              PopupMenuItem(
                value: ActionType.bookmark,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.bookmark_add),
                  label: Text(
                      '${task.isFavorite ? 'Remove from' : 'Add to'} Bookmark'),
                ),
              ),
              PopupMenuItem(
                value: ActionType.archive,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.delete),
                  label: const Text('Archive'),
                ),
              ),
            ]
          : [
              PopupMenuItem(
                value: ActionType.restore,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.restore),
                  label: const Text('Restore'),
                ),
              ),
              PopupMenuItem(
                value: ActionType.delete,
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

enum ActionType { edit, bookmark, archive, restore, delete }
