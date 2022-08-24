import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: Text('I am poor'),
          backgroundColor: Colors.green[500],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Image(image: AssetImage('images/coal.jpg')),
        )),
  ));
}
