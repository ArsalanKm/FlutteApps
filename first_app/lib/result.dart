import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function restartQuiz;
  Result(this._totalScore, this.restartQuiz);

  String get resultPhrase {
    var resultText = 'You did it';
    if (_totalScore >= 10) resultText = 'your score is good';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: restartQuiz,
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
