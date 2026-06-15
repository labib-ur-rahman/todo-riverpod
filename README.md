# Todo Riverpod

A clean Flutter task management app built with `flutter_riverpod`. This project demonstrates how to manage a simple to-do flow using Riverpod's `NotifierProvider`, immutable domain models, and a feature-first folder structure.

## Overview

The app allows users to:

- Add new tasks
- Mark tasks as completed
- Delete tasks
- View task creation time

It is intentionally lightweight, making it a good starter project for learning how Riverpod handles app state in a modern Flutter codebase.

## Tech Stack

- Flutter
- Dart
- `flutter_riverpod`
- Material 3

## Architecture

The project follows a small feature-based structure:

```text
lib/
  main.dart
  src/
    app.dart
    features/
      tasks/
        domain/
          task.dart
        presentation/
          providers/
            task_notifier.dart
          screens/
            task_screen.dart
          widgets/
            task_tile.dart
```

### State Management

Riverpod is initialized at the application root with `ProviderScope` in `main.dart`.  
Task state is managed through `taskNotifierProvider`, which exposes a `TaskNotifier` responsible for:

- creating tasks
- toggling completion state
- removing tasks

The UI watches provider state and rebuilds automatically whenever the task list changes.

## Core Components

### `Task`

The `Task` model represents a single to-do item with:

- `id`
- `title`
- `isCompleted`
- `createdAt`

It also includes a `copyWith` method to support immutable updates.

### `TaskNotifier`

`TaskNotifier` extends Riverpod's `Notifier<List<Task>>` and contains the app's task logic. It updates state immutably so the UI remains predictable and easy to reason about.

### `TaskScreen`

The main screen displays the current task list, empty state, and add-task dialog. It uses `ConsumerWidget` to react to provider changes.

### `TaskTile`

A reusable presentation widget that renders:

- task title
- completion checkbox
- creation time
- delete action

## Getting Started

### Prerequisites

Make sure you have installed:

- Flutter SDK
- Dart SDK
- An emulator, simulator, or physical device

### Installation

```bash
flutter pub get
```

### Run the App

```bash
flutter run
```

## Why This Project Is Useful

This repository is a practical example for developers who want to learn:

- how to set up Riverpod in Flutter
- how to separate domain and presentation layers
- how to update state immutably
- how to keep a small app maintainable with feature-based organization

## Future Improvements

Possible enhancements for the project:

- task persistence with local storage
- edit task support
- task filtering by completion status
- due dates and reminders
- unit and widget tests

## License

This project is available for learning and personal use.
