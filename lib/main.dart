import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'tasks_app.dart';
import 'app_router.dart';
import 'blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      TasksApp(
        appRouter: AppRouter(),
      ),
    ),
    storage: storage,
    blocObserver: TaskBlocObserver(),
  );
}
