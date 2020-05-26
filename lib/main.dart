import 'package:flutter/material.dart';
import 'question.dart';
import 'questionbank.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp   (
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(

          child: Quizpage(),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
Questionbank que = Questionbank();
void correctanswers( bool useranswer){
  bool answer= que.getanswertext();

  setState(() {
    if (que.finished()==true)
      {
        que.reset();
        score=[];
      }
    else
      {
        if (answer==useranswer)
        {score.add(Icon(
          Icons.check,
          color: Colors.green,
        ),
        );
        }
        else
        {
          print('user is wrong');
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ),
          );
        }
      }
    que.nextquestion();

  });
}
  List<Icon> score=[];
//Icon(Icons.check,
  //color: Colors.green),
  //Icon(Icons.close,
  //color:Colors.red)
  //];
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
              que.getquestiontext(),
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
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text(
              'True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              //The user picked true.
              correctanswers(true);
            },
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            color: Colors.red,
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              //The user picked false.
              correctanswers(false);
            },
          ),
        ),
      ),
      Row(
        children: score,
    )
    ]
    );
  }

}
