import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import '../blocs/blocs.dart';
import '../widgets/task_drawer.dart';
import '../widgets/add_task_modal.dart';
import 'pending_screen.dart';
import 'completed_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatelessWidget {
  static const id = '/tabs_screen';

  const TabsScreen({super.key});

  void _showAddTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (ctx) => const AddTaskModal(),
    );
  }

  void _onSwitchTab(BuildContext ctx, int idx) =>
      ctx.read<TabBloc>().add(SwitchTabEvent(index: idx));

  @override
  Widget build(BuildContext context) {
    const screens = [
      Tuple3('Pending Tasks', Icons.list, PendingScreen()),
      Tuple3('Completed Tasks', Icons.done, CompletedScreen()),
      Tuple3('Favorite Tasks', Icons.favorite, FavoritesScreen())
    ];
    final items = screens
        .map((d) => BottomNavigationBarItem(
              label: d.item1,
              icon: Icon(d.item2),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: BlocSelector<TabBloc, TabState, int>(
          selector: (state) => state.currentIdx,
          builder: (ctx, currentIdx) => Text(screens[currentIdx].item1),
        ),
        actions: [
          BlocSelector<TabBloc, TabState, int>(
            selector: (state) => state.currentIdx,
            builder: (ctx, currentIdx) => currentIdx == 0
                ? IconButton(
                    onPressed: () => _showAddTask(context),
                    icon: const Icon(Icons.add),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
      drawer: const TaskDrawer(),
      body: BlocSelector<TabBloc, TabState, int>(
        selector: (state) => state.currentIdx,
        builder: (ctx, currentIdx) => IndexedStack(
          index: currentIdx,
          children: screens.map((d) => d.item3).toList(),
        ),
      ),
      bottomNavigationBar: BlocSelector<TabBloc, TabState, int>(
        selector: (state) => state.currentIdx,
        builder: (ctx, currentIdx) => BottomNavigationBar(
          currentIndex: currentIdx,
          onTap: (idx) => _onSwitchTab(context, idx),
          items: items,
        ),
      ),
      floatingActionButton: BlocSelector<TabBloc, TabState, int>(
        selector: (state) => state.currentIdx,
        builder: (ctx, currentIdx) => currentIdx == 0
            ? FloatingActionButton(
                onPressed: () => _showAddTask(context),
                tooltip: 'Add Task',
                child: const Icon(Icons.add),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
