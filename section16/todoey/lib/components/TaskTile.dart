import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/Task.dart';
import 'package:todoey/models/AppState.dart';

class TaskTile extends StatelessWidget {
  final int taskIndex;
  TaskTile(this.taskIndex);

  @override
  Widget build(BuildContext context) => Consumer<AppState>(
      builder: (context, appState, child) => ListTile(
            leading: Text(
              appState.tasks[taskIndex].title,
              style: _getTextStyle(appState.tasks[taskIndex]),
            ),
            trailing: Checkbox(
              value: appState.tasks[taskIndex].isComplete,
              activeColor: kAccentColor,
              onChanged: (_) => Provider.of<AppState>(context, listen: false)
                  .toggleTask(taskIndex),
            ),
          ));

  TextStyle _getTextStyle(Task task) {
    return (task.isComplete)
        ? kSmallTextStyle.copyWith(decoration: TextDecoration.lineThrough)
        : kSmallTextStyle;
  }
}
