import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';
import 'package:to_do_list/widgets/tasks_list.dart';
import 'package:to_do_list/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(
              top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Icon(
                  Icons.list,
                  size: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Todoey',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),
              ),
              Consumer<TaskData>(
                builder: (context, taskData, child) {
                  return Text(
                    '${taskData.taskCount} tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Consumer<TaskData>(
              builder: (context, taskData, child) {
                return const TaskList();
              },
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
