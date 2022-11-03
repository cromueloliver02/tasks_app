import 'package:flutter/material.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import '../screens/tabs_screen.dart';

class FavoritesScreen extends StatelessWidget {
  static const id = '${TabsScreen.id}/favorites';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Chip(
            label: BlocSelector<TaskBloc, TaskState, List<Task>>(
              selector: (state) => state.favoriteTasks,
              builder: (ctx, favoriteTasks) =>
                  Text('Favorite Tasks: ${favoriteTasks.length}'),
            ),
          ),
        ),
        Expanded(
          child: BlocSelector<TaskBloc, TaskState, List<Task>>(
            selector: (state) => state.favoriteTasks,
            builder: (ctx, favoriteTasks) => TaskList(tasks: favoriteTasks),
          ),
        ),
      ],
    );
  }
}
