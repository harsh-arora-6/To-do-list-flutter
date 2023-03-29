import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Milk'),
  ];
  int get taskCount => _tasks.length;
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  void addNewTask(String task) {
    Task newTask = Task(name: task);
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTaskCheckState(int index) {
    _tasks[index].toggleCheckboxState();
    notifyListeners();
  }

  void removeTask(Task task) {
    if (kDebugMode) {
      print(task);
    }
    _tasks.removeWhere((element) => element == task);
    notifyListeners();
  }
}
