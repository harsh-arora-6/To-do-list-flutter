import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskData();
      },
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
