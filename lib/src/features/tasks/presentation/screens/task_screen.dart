import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tkhan_task/src/features/tasks/presentation/providers/task_notifier.dart';
import 'package:tkhan_task/src/features/tasks/presentation/widgets/task_tile.dart';

/// -- The `TaskScreen` is a `ConsumerWidget`, which allows it to listen to 
/// Riverpod providers and rebuild when the state changes.
class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  /// -- The `build` method is where the UI of the screen is defined. 
  /// It takes a `WidgetRef` parameter, which is used to read and watch providers.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Get `current task list` from the `taskNotifierProvider`. Whenever the task list changes,
    /// this widget will rebuild to reflect the new state.
    /// The `ref.watch` method is used, so if the task list changes, 
    /// the UI will automatically update to show the latest tasks.
    final tasks = ref.watch(taskNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('TKhan')),
      body: tasks.isEmpty
          ? const Center(child: Text('No tasks added yet'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return TaskTile(
                  task: task,
                  /// -- The `onToggle` callback will call the `toggleTask` method on the `TaskNotifier`
                  /// to toggle the completion status of the task when the checkbox is tapped.
                  onToggle: () {
                    /// -- The `ref.read` method is used to get the `TaskNotifier` instance and 
                    /// call the `toggleTask` method with the task's ID.
                    ref.read(taskNotifierProvider.notifier).toggleTask(task.id);
                  },
                  onDelete: () {
                    /// -- The `onDelete` callback will call the `deleteTask` method on the `TaskNotifier`
                    /// to remove the task from the list when the delete button is pressed.
                    ref.read(taskNotifierProvider.notifier).deleteTask(task.id);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Task title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = controller.text.trim();

                if (title.isNotEmpty) {
                  /// -- When the "Add" button is pressed, it reads the `TaskNotifier` and 
                  /// calls the `addTask` method with the title from the text field. 
                  /// This will add a new task to the list and trigger a UI update.
                  ref.read(taskNotifierProvider.notifier).addTask(title);
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
