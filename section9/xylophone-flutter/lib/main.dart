import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              makeButton(1),
              makeButton(2),
              makeButton(3),
              makeButton(4),
              makeButton(5),
              makeButton(6),
              makeButton(7),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeButton(int number) => Expanded(
        child: Container(
          color: getColor(number: number),
          child: TextButton(
            onPressed: () {
              final player = AudioCache();
              player.play(getNoteName(number: number));
            },
          ),
        ),
      );

  String getNoteName({int number}) => 'note$number.wav';

  Color getColor({int number}) => [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple
      ][number - 1];
}
