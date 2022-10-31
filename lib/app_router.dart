import 'screens/tasks_screen.dart';
import 'screens/archive_screen.dart';

class AppRouter {
  final routes = {
    TasksScreen.id: (ctx) => const TasksScreen(),
    ArchiveScreen.id: (ctx) => const ArchiveScreen(),
  };
}
