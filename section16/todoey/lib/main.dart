import 'package:flutter/material.dart';
import 'package:todoey/screens/TasksScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: TasksScreen());
}
