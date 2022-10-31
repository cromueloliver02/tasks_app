import 'package:flutter/material.dart';
import 'app_router.dart';
import '../blocs/blocs.dart';
import 'screens/tasks_screen.dart';

class TasksApp extends StatelessWidget {
  const TasksApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TaskBloc(),
      child: MaterialApp(
        title: 'Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: TasksScreen.id,
        routes: appRouter.routes,
      ),
    );
  }
}
