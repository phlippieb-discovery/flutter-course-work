import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class ListItemWidget extends StatefulWidget {
  ListItemWidget(this.text, {required this.isComplete});

  final String text;
  final bool isComplete;

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: kSmallTextStyle,
            ),
            Icon(
                widget.isComplete ? Icons.check_circle : Icons.circle_outlined),
          ],
        ),
      );
}
