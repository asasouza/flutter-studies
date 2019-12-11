import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//  runApp(MainApp());
// }

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _onAnswer(int score) {
    _totalScore += score; 
    setState(() {
      _questionIndex++;
    });

    print(_totalScore);
    print('Answer chosen');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'question': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Red', 'score': 1},
          {'text': 'Black', 'score': 2},
          {'text': 'Blue', 'score': 3},
          {'text': 'White', 'score': 4},
        ]
      },
      {
        'question': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Dog', 'score': 1},
          {'text': 'Cat', 'score': 2},
          {'text': 'Horse', 'score': 3},
          {'text': 'Chicken', 'score': 4},
        ]
      },
      {
        'question': 'What\'s your favorite character?',
        'answers': [
          {'text': 'Batman', 'score': 1},
          {'text': 'Superman', 'score': 2},
          {'text': 'Spider Man', 'score': 3},
          {'text': 'Thor', 'score': 4},
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Application'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions[_questionIndex], _onAnswer)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
