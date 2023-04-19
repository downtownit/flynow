import 'package:flutter/material.dart';
import 'package:my_app/questionary.dart';
import './result.dart';

void main() => runApp(AskApp());

class _AskAppState extends State<AskApp> {
  var _askSelected = 0;
  var _pointsTotal = 0;

  final _asks = const [
    {
      'txt': 'Whats is your favorite color?',
      'answer': [
        {'txt': 'Black', 'points': 10},
        {'txt': 'White', 'points': 6},
        {'txt': 'Yellow', 'points': 3},
        {'txt': 'Gray', 'points': 2},
      ]
    },
    {
      'txt': 'Whats is your favorite animal?',
      'answer': [
        {'txt': 'Turtle', 'points': 10},
        {'txt': 'Fish', 'points': 6},
        {'txt': 'Lion', 'points': 3},
        {'txt': 'Monkey', 'points': 2},
      ]
    },
    {
      'txt': 'Whats is your favorite Teacher?',
      'answer': [
        {'txt': 'Rodrigo Branas', 'points': 10},
        {'txt': 'Leonardo Leitão', 'points': 6},
        {'txt': 'Joel Jota', 'points': 3},
        {'txt': 'Steve Jobs', 'points': 2},
      ]
    }
  ];

  bool get hasSelectedQuestion {
    return _askSelected < _asks.length;
  }

  void _answer(int points) {
    if (hasSelectedQuestion) {
      setState(() {
        _askSelected++;
        _pointsTotal += points;
      });
    }
  }

  void _restartQuestionary() {
    setState(() {
      _askSelected = 0;
      _pointsTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Asks'),
        ),
        body: hasSelectedQuestion
            ? Questionary(
                asks: _asks,
                askSelected: _askSelected,
                whenAnswer: _answer,
              )
            : Result(_pointsTotal, _restartQuestionary),
      ),
    );
  }
}

class AskApp extends StatefulWidget {
  const AskApp({Key? key}) : super(key: key);

  @override
  _AskAppState createState() {
    return _AskAppState();
  }
}
