import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTask =
        ''; // each time this widget appears, we want text field to be empty;
    return Container(
      color: const Color(0xff6a6a6a),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // text changed
                  newTask = value;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Consumer<TaskData>(builder: (context, taskData, child) {
                return TextButton(
                  onPressed: () {
                    // update the tasks list
                    // updateTaskList(newTask);
                    taskData.addNewTask(newTask);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text('Add'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
