import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Questionary extends StatelessWidget {
  final List<Map<String, Object>> asks;
  final int askSelected;
  final void Function(int) whenAnswer;

  Questionary({
    required this.asks,
    required this.askSelected,
    required this.whenAnswer,
  });

  bool get hasSelectedQuestion {
    return askSelected < asks.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion ? asks[askSelected]['answer'] as List<Map<String, Object>> : [];

    return Column(
      children: <Widget>[
        Question(asks[askSelected]['txt'].toString()),
        ...answers.map((resp) {
          return Answer(
            resp['txt'] as String,
            () => whenAnswer(int.parse(resp['points'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
