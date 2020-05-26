import 'question.dart';

class Questionbank {
int _questionnumber=0;
  List <Question> _quest =[
    Question(q: 'HIV/AIDS is the disease affecting the artists in the Tony Award-winning musical Rent.', a: true),
    Question(q:'The Sex Pistols were part of the "British Invasion" that popularized rock and roll in the 1960s.', a:false),
    Question(q:'The pointed spire of the Empire State Building (1931) was designed to moor Zeppelin airships.',a:true),
    Question(q:'NASCAR traces its origins to bootleggers outrunning the police during Prohibition.',a:true),
    Question(q:'Hair grows back thicker and darker after it\'s cut',a:false),
    Question(q:'The Pyramids of Giza are the only one of the "Seven Wonders of the Ancient World" that remains substantially intact.',a:true),

  ];

void nextquestion(){
  if(_questionnumber<_quest.length-1)
  _questionnumber++;
}

String getquestiontext(){
  return  _quest[_questionnumber].questiontext;


}

bool getanswertext(){
  return _quest[_questionnumber].answer;
}
bool finished(){

  if (_questionnumber >= _quest.length - 1) {


    return true;

  } else {
    return false;
  }
}

//TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
void reset() {
  _questionnumber = 0;
}
}