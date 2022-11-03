import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        children: tasks
            .map((d) => ExpansionPanelRadio(
                  value: d.id,
                  canTapOnHeader: true,
                  headerBuilder: (ctx, isOpen) => TaskTile(task: d),
                  body: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: SelectableText.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Title\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '${d.title}\n\n'),
                            const TextSpan(
                              text: 'Description\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: d.description),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
