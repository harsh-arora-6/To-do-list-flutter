import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:to_do_list/models/task.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    // List view builder is efficient for large list, it builds only those widgets which appear on screen.
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              Task task = taskData.tasks[index];
              return TaskTile(
                  checkedValue: task.isDone,
                  name: task.name,
                  toggleCheckboxState: (checkboxState) {
                    //change the check state here and notify listeners
                    taskData.updateTaskCheckState(index);
                  },
                  longPressCallback: () {
                    taskData.removeTask(task);
                  });
            },
            itemCount: taskData.taskCount,
          );
        },
      ),
    );
  }
}
