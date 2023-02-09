import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
  //GETTER TO GET NAME OF TASK
  String getTaskName(int index) {
    return _tasks[index].name;
  }
  //check if task is done
  bool isTaskDone(int index) {
    return _tasks[index].isDone;
  }
  //toggle task done
  void toggleTaskDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
  void updateTask(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
