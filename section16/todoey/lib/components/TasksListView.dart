import 'package:flutter/material.dart';
import 'TaskTile.dart';
import '../models/Task.dart';

class TasksListWidget extends StatelessWidget {
  final List<Task> tasks;
  final Function onToggle;

  TasksListWidget(this.tasks, this.onToggle);

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: tasks.length,
      itemBuilder: ((context, i) => TaskTile(tasks[i], (_) => onToggle(i))));
}
