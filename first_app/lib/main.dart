import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 9},
        {'text': 'Green', 'score': 8},
        {'text': 'White', 'score': 7}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Horse', 'score': 10},
        {'text': 'Dog', 'score': 9},
        {'text': 'Cat', 'score': 8},
        {'text': 'dog', 'score': 7}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'max', 'score': 10},
        {'text': 'max', 'score': 9},
        {'text': 'max', 'score': 8},
        {'text': 'max', 'score': 7}
      ],
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(_questionIndex, _questions, _answerQuestion)
                : Result(_totalScore, restartQuiz)));
  }
}
