import 'package:flutter/material.dart';

import 'features/tasks/presentation/screens/task_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Task App',

      /// -- Using Material 3 design with a blue color scheme.
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const TaskScreen(),
    );
  }
}
