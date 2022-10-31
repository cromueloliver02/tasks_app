import 'package:flutter/material.dart';
import 'app_router.dart';
import 'app_theme.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => TaskBloc()),
        BlocProvider(create: (ctx) => BrightnessBloc()),
      ],
      child: BlocSelector<BrightnessBloc, BrightnessState, bool>(
        selector: (state) => state.isDark,
        builder: (context, isDark) => MaterialApp(
          title: 'Tasks App',
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: AppThemes.appThemeData[AppTheme.lightTheme],
          darkTheme: AppThemes.appThemeData[AppTheme.darkTheme],
          initialRoute: TasksScreen.id,
          routes: appRouter.routes,
        ),
      ),
    );
  }
}
