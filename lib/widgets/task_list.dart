import 'package:flutter/material.dart';
import 'package:todoyama/models/task_data.dart';
import '../screens/add_task_screen.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<TaskData>(context).taskCount == 0
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 220.0) ,
            width: double.infinity,
            child: Material(
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: () {
                  //add new task
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AddTaskScreen(
                      addTaskCallback: (newTask) {
                        Provider.of<TaskData>(context, listen: false).addTask(newTask);
                      },
                    ),
                  );
                },
                child: const Text(
                  "Add a task.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          )
        : Consumer(
          builder: (context, TaskData taskData, child) {
            return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              return TaskTile(
                onLongPress: () {
                  //show popup to confirm delete
                  showDialog(context: context, builder: (context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    title:  Text("Delete Task",style: TextStyle(color: Theme.of(context).primaryColor),),
                    content: const Text("Are you sure you want to delete this task?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child:  Text("Cancel",style: TextStyle(color: Theme.of(context).primaryColor),),
                      ),
                      TextButton(
                        onPressed: () {
                          taskData.deleteTask(index);
                          Navigator.pop(context);
                        },
                        child: const Text("Delete",style: TextStyle(color: Colors.deepOrangeAccent)),
                      ),
                    ],
                  ));
                },
                taskTitle: taskData.getTaskName(index),
                isChecked:  taskData.isTaskDone(index),
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(index);
                },
              );
            },
          );
          },
        );
  }
}
