import 'package:flutter/material.dart';
import 'TaskTile.dart';
import '../models/AppState.dart';
import 'package:provider/provider.dart';

class TasksListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<AppState>(
      builder: (context, appState, child) => ListView.builder(
            itemCount: appState.tasks.length,
            itemBuilder: (_, i) => TaskTile(
              appState.tasks[i],
              () => appState.toggleTask(i),
              () => appState.deleteTask(i),
            ),
          ));
}
