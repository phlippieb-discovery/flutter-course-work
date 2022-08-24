import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cash Money"),
          backgroundColor: Colors.yellow[500],
        ),
        backgroundColor: Colors.blueGrey[50],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image(
              image: AssetImage('images/bg.jpg')
            ),
          ),
        ),
      ),
    ),
  );
}
