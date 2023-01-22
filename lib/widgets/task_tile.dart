import 'package:flutter/material.dart';

//class to store tasks
class TaskTile extends StatelessWidget {
  TaskTile(this.taskTitle);

  final String taskTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$taskTitle'),
      trailing: TaskCheckbox(),
    );
  }
}

class TaskCheckbox extends StatefulWidget {
  @override
  State<TaskCheckbox> createState() => _TaskCheckboxState();
}

class _TaskCheckboxState extends State<TaskCheckbox> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: ischecked,
      activeColor: Colors.lightBlueAccent,
      onChanged: (value) {
        setState(() {
          ischecked = value!;
        });
      },
    );
  }
}
