//import 'dart:html';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() whenRestarQuestionary;

  Result(this.points, this.whenRestarQuestionary);

  String get phraseResult {
    if (points < 7) {
      return 'Parabéns!';
    } else if (points < 10) {
      return 'Você é bom!';
    } else if (points < 20) {
      return 'Impressionante!';
    } else {
      return 'Nível Monster...';
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              phraseResult,
              style: TextStyle(fontSize: 28),
            ),
          ),
          TextButton(
            child: Text('Reiniciar', style: TextStyle(fontSize: 18)),
            style: TextButton.styleFrom(),
            onPressed: whenRestarQuestionary,
          ),
        ],
      );
}
