import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'Task.dart';

class AppState extends ChangeNotifier {
  List<Task> tasks = [];

  AppState({this.tasks = const []});

  void toggleTask(int index) {
    tasks[index].toggle();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void addTask(String title) {
    tasks.add(Task(title));
    notifyListeners();
  }
}
