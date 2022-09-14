import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class CreateTaskWidget extends StatefulWidget {
  Function onCreateTask;

  CreateTaskWidget({required this.onCreateTask});

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  String _currentText = '';

  @override
  Widget build(BuildContext context) => Container(
        color: const Color(0xff757575),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: kCardBorderRadius,
              topRight: kCardBorderRadius,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Heading
              const Text(
                'Add task',
                style: kMediumTextStyle,
              ),
              // Text field
              const SizedBox(height: 20),
              TextField(
                style: kSmallTextStyle,
                decoration: const InputDecoration(
                  filled: true,
                  focusColor: kAccentColor,
                ),
                autofocus: true,
                onChanged: (value) => _currentText = value,
                onEditingComplete: _onCreate,
              ),
              // Button
              const SizedBox(height: 20),
              TextButton(
                onPressed: _onCreate,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    // width: 300,
                    color: kAccentColor,
                    child: Center(
                      child: Text(
                        'Add',
                        style: kSmallTextStyle.copyWith(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );

  void _onCreate() {
    Navigator.pop(context);
    widget.onCreateTask(_currentText);
  }
}
