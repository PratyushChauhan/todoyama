import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoyama/screens/Tasks_screen.dart';
import 'package:todoyama/models/task_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.orangeAccent,
          iconTheme: const IconThemeData(color: Colors.white),
         ),
        home: TasksScreen(),
      ),
    );
  }
}
