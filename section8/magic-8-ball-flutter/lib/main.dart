import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ask me something"),
        ),
        backgroundColor: Colors.blue,
        body: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int n = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Image.asset('images/ball$n.png'),
        onPressed: () {
          setState(() {
            updateBall();
          });
        },
      ),
    );
  }

  void updateBall() {
    n = Random().nextInt(5) + 1;
  }
}
