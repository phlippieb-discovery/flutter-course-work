import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/components/TasksListView.dart';
import 'package:todoey/models/AppState.dart';
import 'package:todoey/models/Task.dart';
import 'package:todoey/screens/CreateTaskWidget.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/AppState.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // MARK: State
  // List<Task> tasks = [
  //   Task('Add your first task'),
  // ];

  // MARK: UI
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kAccentColor,
        floatingActionButton: _buildFloatingButton(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_buildHeader(context), _buildItemsPage(context)],
        ),
      );

  Widget _buildFloatingButton(BuildContext context) => FloatingActionButton(
        backgroundColor: kAccentColor,
        child: const Icon(
          Icons.create,
        ),
        onPressed: () => _onFloatingButton(context),
      );

  void _onFloatingButton(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: CreateTaskWidget(),
          ),
        ),
      );

  Widget _buildHeader(BuildContext context) => SafeArea(
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
                '${Provider.of<AppState>(context).tasks.length} tasks',
                style: kSmallTextStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );

  Widget _buildItemsPage(BuildContext context) => Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: kCardBorderRadius,
              topRight: kCardBorderRadius,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: TasksListWidget(),
        ),
      );
}
