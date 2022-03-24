import 'dart:core';

import 'package:flutter/material.dart';
import 'package:quizzler/QuestionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank quiz = QuestionBank();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ScoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuesText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                if (quiz.getQuesAns() == true) {
                  ScoreKeeper.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  ScoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  if (quiz.questionNo < quiz.len() - 1) {
                    quiz.questionNo++;
                  } else {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "RFLUTTER ALERT",
                      desc: "End Of Quiz",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "COOL",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    quiz.questionNo = 0;
                    ScoreKeeper.clear();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                if (quiz.getQuesAns() == false) {
                  ScoreKeeper.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  ScoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  if (quiz.questionNo < quiz.len() - 1) {
                    quiz.questionNo++;
                  } else {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "RFLUTTER ALERT",
                      desc: "End Of Quiz",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "COOL",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    quiz.questionNo = 0;
                    ScoreKeeper.clear();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: ScoreKeeper,
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
