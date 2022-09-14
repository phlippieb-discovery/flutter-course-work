import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/Task.dart';
import 'package:todoey/models/AppState.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onLongPress;

  TaskTile(this.task, this.onToggle, this.onLongPress);

  @override
  Widget build(BuildContext context) => Consumer<AppState>(
      builder: (context, appState, child) => ListTile(
            leading: GestureDetector(
              onLongPress: onLongPress,
              child: Text(
                task.title,
                style: _getTextStyle(isComplete: task.isComplete),
              ),
            ),
            trailing: Checkbox(
              value: task.isComplete,
              activeColor: kAccentColor,
              onChanged: (_) => onToggle(),
            ),
          ));

  TextStyle _getTextStyle({required bool isComplete}) {
    return (isComplete)
        ? kSmallTextStyle.copyWith(decoration: TextDecoration.lineThrough)
        : kSmallTextStyle;
  }
}
