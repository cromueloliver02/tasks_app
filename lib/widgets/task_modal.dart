import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../blocs/blocs.dart';
import '../models/task.dart';

class TaskModal extends StatefulWidget {
  const TaskModal({
    super.key,
    this.task,
  });

  final Task? task;

  @override
  State<TaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<TaskModal> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  void _addTask() {
    if (_titleController.text.isEmpty || _descController.text.isEmpty) return;

    final task = Task(
      id: const Uuid().v1(),
      title: _titleController.value.text,
      description: _descController.value.text,
      dateTime: DateTime.now(),
    );

    context.read<TaskBloc>().add(AddTask(task: task));

    _closeAddTaskModal();
  }

  void _updateTask() {
    if (_titleController.text.isEmpty || _descController.text.isEmpty) return;

    final newTask = widget.task!.copyWith(
      title: _titleController.value.text,
      description: _descController.value.text,
      dateTime: DateTime.now(),
    );

    context.read<TaskBloc>().add(UpdateTask(task: newTask));

    _closeAddTaskModal();
  }

  void _closeAddTaskModal() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  widget.task == null ? 'Add Task' : 'Edit Task',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _descController,
                  minLines: 3,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: _closeAddTaskModal,
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: widget.task == null ? _addTask : _updateTask,
                      child: Text(widget.task == null ? 'Add' : 'Update'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title);
    _descController = TextEditingController(text: widget.task?.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
