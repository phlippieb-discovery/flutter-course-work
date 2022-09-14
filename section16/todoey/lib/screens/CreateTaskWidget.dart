import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class CreateTaskWidget extends StatefulWidget {
  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
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
              const TextField(
                style: kSmallTextStyle,
                decoration: InputDecoration(
                  filled: true,
                  focusColor: kAccentColor,
                ),
                autofocus: true,
              ),
              // Button
              const SizedBox(height: 20),
              TextButton(
                child: Container(
                    padding: EdgeInsets.all(8),
                    // width: 300,
                    color: kAccentColor,
                    child: Center(
                      child: Text(
                        'Add',
                        style: kSmallTextStyle.copyWith(color: Colors.white),
                      ),
                    )),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
