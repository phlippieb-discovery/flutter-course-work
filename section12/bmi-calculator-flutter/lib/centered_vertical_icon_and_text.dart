import 'package:flutter/material.dart';

const interItemSpacing = 10.0;

class CenteredVerticalIconAndText extends StatelessWidget {
  CenteredVerticalIconAndText(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
        ),
        SizedBox(height: interItemSpacing),
        Text(
          this.text,
        ),
      ],
    );
  }
}
