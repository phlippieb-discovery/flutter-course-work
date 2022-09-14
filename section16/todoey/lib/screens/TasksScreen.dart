import 'package:flutter/material.dart';
// import 'package:todoey/components/ListItemWidget.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/components/TaskTile.dart';
import 'package:todoey/components/TasksListView.dart';
import 'package:todoey/models/Task.dart';
import 'package:todoey/screens/CreateTaskWidget.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // MARK: State
  List<Task> tasks = [
    Task('Add your first task'),
  ];

  // MARK: UI
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kAccentColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kAccentColor,
          child: const Icon(
            Icons.create,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: CreateTaskWidget(
                    onCreateTask: _onAdd,
                  ),
                ),
              ),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(
                        Icons.list,
                        size: 50,
                        color: kAccentColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Todoey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '12 tasks',
                      style: kSmallTextStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: kCardBorderRadius,
                    topRight: kCardBorderRadius,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TasksListWidget(tasks, _onToggle),
              ),
            ),
          ],
        ),
      );

  void _onAdd(String title) => setState(() {
        tasks.add(Task(title));
      });

  void _onToggle(int index) => setState(() {
        tasks[index].toggle();
      });
}
