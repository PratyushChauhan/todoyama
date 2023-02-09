import 'package:flutter/material.dart';

//class to store tasks
class TaskTile extends StatefulWidget {
  TaskTile(
      {this.taskTitle = "",
      this.isChecked = false,
      required this.checkboxCallback,required this.onLongPress});

  final String taskTitle;
  final isChecked;
  final Function(bool?) checkboxCallback;
  final Function onLongPress;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        widget.onLongPress();
      },
      title: Text(
        '${widget.taskTitle}',
        style: TextStyle(
          decoration: ischecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: ischecked,
        onChanged: (value) {
          setState(() {
            ischecked = value!;
          });
          widget.checkboxCallback(value);
        },
      ),
    );
  }
}
