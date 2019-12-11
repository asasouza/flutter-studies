import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function onReset;

  Result(this.score, this.onReset);

  String get resultText {
    if (score < 4) {
      return 'Your score is low!';
    } else if (score < 8) {
      return 'Your score is median!';
    } else {
      return 'Your score is high!';
    }
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultText,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Reset Quiz', style: TextStyle(fontSize: 20),),
          onPressed: onReset,
          textColor: Colors.blueAccent,
        )
      ],
    ));
  }
}
