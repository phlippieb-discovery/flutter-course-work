import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/input_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'gender.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.gender, this.height, this.weight, this.age});

  Gender gender;
  int height;
  int weight;
  int age;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "YOUR RESULT",
            style: k.bigTextStyle,
          ),
          InputCard(
            cardColor: k.inputCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(getEvaluation()),
                Text(getBMI()),
                Text(getComment())
              ],
            ),
          ),
        ],
      ));

  String getEvaluation() {
    return 'Normal';
  }

  String getBMI() {
    return CalculatorBrain.getBMI(height: height, weight: weight)
        .toStringAsFixed(1);
  }

  String getComment() {
    return 'Good job!';
  }
}
