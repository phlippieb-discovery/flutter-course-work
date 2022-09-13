import 'package:flutter/material.dart';
import 'package:todoey/components/ListItemWidget.dart';
import 'package:todoey/constants.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kAccentColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kAccentColor,
          child: Icon(
            Icons.create,
          ),
          onPressed: () {},
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(
                        Icons.list,
                        size: 50,
                        color: kAccentColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: kCardBorderRadius,
                    topRight: kCardBorderRadius,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListItemWidget('Buy milk', isComplete: false),
                    ListItemWidget('Buy eggs', isComplete: false),
                    ListItemWidget('Buy bread', isComplete: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
