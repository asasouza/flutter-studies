import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onAnswer;
  final String text;

  Answer(this.text, this.onAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(text),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onAnswer,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
    );
  }
}
