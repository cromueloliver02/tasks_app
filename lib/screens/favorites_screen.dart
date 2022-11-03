import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';

class FavoritesScreen extends StatelessWidget {
  static const id = '${TabsScreen.id}/favorites';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('FAVORITES SCREEN'),
    );
  }
}
