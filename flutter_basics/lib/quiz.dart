import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Map<String, Object> question;
  final Function onAnswer;

  Quiz(this.question, this.onAnswer);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question['question']),
        ...(question['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(answer['text'], () => onAnswer(answer['score']));
        }).toList(),
      ],
    );
  }
}
