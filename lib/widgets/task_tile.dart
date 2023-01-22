import 'package:flutter/material.dart';

//class to store tasks
class TaskTile extends StatefulWidget {
  TaskTile(this.taskTitle);

  final String taskTitle;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${widget.taskTitle}',
        style: TextStyle(
          decoration: ischecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
          isChecked: ischecked,
          checkboxCallback: (bool? checkboxState) {
            setState(() {
              ischecked = checkboxState!;
            });
          }),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function checkboxCallback;

  TaskCheckbox({required this.isChecked, required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Colors.lightBlueAccent,
      onChanged: (bool? checkboxState) {
        checkboxCallback(checkboxState);
      },
    );
  }
}
