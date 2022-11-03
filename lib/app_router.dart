import 'screens/tabs_screen.dart';
import 'screens/pending_screen.dart';
import 'screens/completed_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/archive_screen.dart';

class AppRouter {
  final routes = {
    TabsScreen.id: (ctx) => const TabsScreen(),
    PendingScreen.id: (ctx) => const PendingScreen(),
    CompletedScreen.id: (ctx) => const CompletedScreen(),
    FavoritesScreen.id: (ctx) => const FavoritesScreen(),
    ArchiveScreen.id: (ctx) => const ArchiveScreen(),
  };
}
