import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final bool checkedValue;
  final String name;
  final void Function(bool?) toggleCheckboxState;
  final void Function() longPressCallback;
  const TaskTile({
    super.key,
    required this.checkedValue,
    required this.name,
    required this.toggleCheckboxState,
    required this.longPressCallback,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListTile(
          onLongPress: longPressCallback,
          title: Text(
            name,
            style: TextStyle(
                decoration:
                    checkedValue == true ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            value: checkedValue,
            checkColor: Colors.lightBlueAccent,
            onChanged: toggleCheckboxState,
          ));
    });
  }
}
