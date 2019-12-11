import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _onAnswer() {
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'What\'s your favorite color?',
        'answers': ['Red', 'Black', 'Blue', 'White']
      },
      {
        'question': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Cat', 'Horse', 'Chicken']
      },
      {
        'question': 'What\'s your favorite character?',
        'answers': ['Batman', 'Superman', 'Spider Man', 'Thor']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Application'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex]['question']),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(answer, _onAnswer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
