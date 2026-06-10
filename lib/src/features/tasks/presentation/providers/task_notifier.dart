import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/task.dart';

/// -- This provider will manage the state of the task list in the application.
final taskNotifierProvider = NotifierProvider<TaskNotifier, List<Task>>(
  /// -- The `TaskNotifier.new` syntax is a shorthand for
  /// creating a new instance of `TaskNotifier`.
  /// Riverpod will automatically created `TaskNotifier` object and manage its lifecycle.
  TaskNotifier.new,
);

/// -- The `TaskNotifier` class extends `Notifier<List<Task>>`, which means 
/// it will manage a list of `Task` objects as its state.
/// This class is a Riverpod Notifier that will handle 
/// the logic for adding, toggling, and deleting tasks.
class TaskNotifier extends Notifier<List<Task>> {
  @override
  List<Task> build() {
    /// -- Initial state of the task list is an empty list.
    return [];
  }

  void addTask(String title) {
    /// -- Creating a new `Task` instance with the provided title
    /// and default values for other properties.
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    /// -- Updating the state by adding the new task to the existing list of tasks.
    /// The `state` variable is provided by the `Notifier` class
    /// and represents the current state of the task list.
    
    state = [...state, newTask]; /// First add all task also add newTask
    // In Getx `tasks.add(newTask);` but in Riverpod `state = [...state, newTask];`
  }

  /// -- The `toggleTask` method will toggle the completion status of a task
  /// based on its ID. It creates a new list of tasks where the specified task's
  /// `isCompleted` property is flipped, while all other tasks remain unchanged.
  void toggleTask(String taskId) {
    state = [
      for (final task in state)
        if (task.id == taskId)
          task.copyWith(isCompleted: !task.isCompleted)
        else
          task,
    ];
  }

  /// -- The `deleteTask` method will remove a task from the list based on its ID.
  /// It creates a new list of tasks that includes only those tasks 
  /// whose ID does not match the specified `taskId`.
  void deleteTask(String taskId) {
    state = state.where((task) => task.id != taskId).toList();
  }
}
