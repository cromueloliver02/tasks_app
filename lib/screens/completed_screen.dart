import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';

class CompletedScreen extends StatelessWidget {
  static const id = '${TabsScreen.id}/completed';

  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('COMPLETED SCREEN'),
    );
  }
}
