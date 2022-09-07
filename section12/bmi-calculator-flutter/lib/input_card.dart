import 'package:flutter/material.dart';

const margin = 15.0;
const borderRadius = 10.0;

class InputCard extends StatelessWidget {
  InputCard({@required this.cardColor, this.cardChild, this.onTap});

  final Color cardColor;
  final Widget cardChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.all(margin),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: cardChild,
        ),
        onTap: this.onTap,
      ),
    );
  }
}
