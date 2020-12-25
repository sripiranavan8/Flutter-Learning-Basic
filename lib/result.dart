import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPharse {
    var resultText = 'You answer all questions!!!';
    if (resultScore <= 5) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 10) {
      resultText = 'Pretty Likeable';
    } else if (resultScore <= 12) {
      resultText = 'You are strange';
    } else {
      resultText = 'your are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPharse,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
            textColor: Colors.white,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
