import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 4},
        {'text': 'Green', 'score': 3},
        {'text': 'Black', 'score': 2}
      ]
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 2},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Tiger', 'score': 4}
      ]
    },
    {
      'questionText': 'What\s your favorite programming language?',
      'answers': [
        {'text': 'PHP', 'score': 1},
        {'text': 'JAVA', 'score': 2},
        {'text': 'DART', 'score': 4},
        {'text': 'JavaScript', 'score': 3}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_totalScore);
    if (_questionIndex < questions.length) {
      print('You have more questions to answer');
    } else {
      print('You answered all questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _restQuiz),
      ),
    );
  }
}
