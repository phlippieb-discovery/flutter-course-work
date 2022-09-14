import 'package:flutter/material.dart';
import 'TaskTile.dart';
import '../models/AppState.dart';
import 'package:provider/provider.dart';

class TasksListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: Provider.of<AppState>(context).tasks.length,
      itemBuilder: ((_, i) => TaskTile(i)));
}
