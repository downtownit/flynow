import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String txt;
  final void Function() onSelected;

  const Answer(this.txt, this.onSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: onSelected,
        child: Text(txt),
      ),
    );
  }
}
