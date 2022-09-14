import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/AppState.dart';
import 'package:todoey/models/Task.dart';
import 'package:todoey/screens/TasksScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => AppState(),
        child: MaterialApp(
          home: TasksScreen(),
        ),
      );
}
