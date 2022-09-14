import 'package:flutter/material.dart';
import 'TaskTile.dart';
import '../models/Task.dart';

class TasksListView extends StatefulWidget {
  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  List<Task> tasks = [
    Task('Buy milk'),
    Task('Buy eggs'),
    Task('Buy milk'),
    Task('Buy cream soda'),
  ];

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: tasks.length,
      itemBuilder: ((context, i) => TaskTile(tasks[i], (_) => _onToggle(i))));

  void _onToggle(int index) {
    setState(() {
      tasks[index].toggle();
    });
  }
}
