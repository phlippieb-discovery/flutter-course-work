import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/Task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool?) onToggle;

  TaskTile(this.task, this.onToggle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        task.title,
        style: _getTextStyle(),
      ),
      trailing: Checkbox(
        value: task.isComplete,
        activeColor: kAccentColor,
        onChanged: onToggle,
      ),
    );
  }

  TextStyle _getTextStyle() {
    return (task.isComplete)
        ? kSmallTextStyle.copyWith(decoration: TextDecoration.lineThrough)
        : kSmallTextStyle;
  }
}
