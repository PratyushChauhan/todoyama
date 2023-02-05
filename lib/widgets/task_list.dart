import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoyama/models/task.dart';

class TaskList extends StatefulWidget {
  TaskList({required this.tasks});
  List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = widget.tasks;

    return tasks.length == 0
        ? Container(
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            child: const Text(
              "Add a task.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          )
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(
                taskTitle: tasks[index].name,
                isChecked: tasks[index].isDone,
                checkboxCallback: (checkboxState) {
                  setState(() {
                    tasks[index].toggleDone();
                  });
                },
              );
            },
          );
  }
}
