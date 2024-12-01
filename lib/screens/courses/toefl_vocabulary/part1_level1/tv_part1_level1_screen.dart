import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:beable/providers/toefl_vocabulary/tv_part1_level1.dart';
import 'package:beable/screens/courses/toefl_vocabulary/part1_level1/tv_question1.dart';
import 'package:beable/screens/courses/toefl_vocabulary/part1_level1/tv_question2.dart';
import 'package:beable/screens/courses/toefl_vocabulary/part1_level1/tv_question3.dart';
import 'package:beable/screens/courses/toefl_vocabulary/part1_level1/tv_question4.dart';
import 'package:beable/screens/courses/toefl_vocabulary/part1_level1/tv_question5.dart';
import 'package:beable/screens/courses/toefl_vocabulary/toefl_vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beable/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../../../model/tvcourses_model.dart';
import '../../../home_screen.dart';
class tv_part1_level1 extends StatefulWidget {
  tv_part1_level1({Key? key}) : super(key: key);

  @override
  State<tv_part1_level1> createState() => _tv_part1_level1State();
  
}

class _tv_part1_level1State extends State<tv_part1_level1> 
  {
  User? user= FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
    void initState() {
    super.initState();
    FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((value){
        this.loggedInUser = UserModel.fromMap(value.data());
        setState((){});
      });
  }
  @override
  
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController resultcontroller = new TextEditingController();
  int currentStep = 0;
  bool hide = false;
  int result= 0;
  int fails = 0;

  void resultAnswer(BuildContext context ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.blue,
          title: new Text("Answer:",
          
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          
          content:Container(
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Text("$result / 5 ",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),
        ),
          actions: <Widget>[
            new TextButton(
              child: new Text("Continue",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, 
                MaterialPageRoute(builder: (context)=> toefl_vocabulary()),
                (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  void emptyOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.teal,
          title: new Text("Select a Option",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          actions: <Widget>[
            new TextButton(
              child: new Text("Continue",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    
  }
  
  void levelFail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.red,
          title: new Text("Failed Level",
          
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          
          content:Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Text("You got 2\nwrong answers",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),
        ),
          actions: <Widget>[
            new TextButton(
              child: new Text("Continuar",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => toefl_vocabulary()));
              },
            ),
          ],
        );
      },
    );
  }
  
  void incorrectAnswer(BuildContext context,String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.red,
          title: new Text("Wrong Answer",
          
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          
          content:Container(
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Text("Answer: $text",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),
        ),
          actions: <Widget>[
            new TextButton(
              child: new Text("Continue",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => fails += 1);
                if (fails == 2){
                  levelFail(context);
                }else{
                  setState(() => currentStep += 1);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void correctAnswer(BuildContext context) {
      final player = AudioPlayer();
          player.play(AssetSource('audio/correct.mp3'));
    final isLastStep = currentStep == getSteps().length;
    showDialog(
      
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.green,
          
          title: new Text("Correct Answer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          actions: <Widget>[
            new TextButton(
              child: new Text("Continuar",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
              onPressed: () {
                
                Navigator.of(context).pop();
                setState(() => currentStep += 1);
                setState(() => result += 1);
              },
            ),
          ],
        );
      },
    ); 
  }
  
  void lastcorrectAnswer(BuildContext context) {
      final player = AudioPlayer();
          player.play(AssetSource('audio/correct.mp3'));
    final isLastStep = currentStep == getSteps().length;
    showDialog(
      
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.green,
          
          title: new Text("Correct Answer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom:16.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )  
          ],
        );
      },
    ); 
  }
  
  void lastincorrectAnswer(BuildContext context,String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.red,
          title: new Text("Incorrect Answer",
          
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
          
          content:Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Text("Answer: $text",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),
        ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom:16.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )  
          ]
        );
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    Tv_Part1_Level1Info watch = context.watch<Tv_Part1_Level1Info>();
    return Scaffold(
      appBar: AppBar(title: Text("TOEFL - Level 1", style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold, 
        fontSize:20, ),), centerTitle: true,),
      body: Stepper(
      
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        
        onStepContinue: (){
        final isLastStep = currentStep == getSteps().length - 1;

          if (currentStep == 0){
            if (watch.question1.isEmpty == false){
              if(watch.question1 != "2"){
                incorrectAnswer(context,"2");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }

          if (currentStep == 1){
            if (watch.question2.isEmpty == false){
              if(watch.question2 != "3"){
                incorrectAnswer(context,"3");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }

          if (currentStep == 2){
            if (watch.question3.isEmpty == false){
              if(watch.question3 != "3"){
                incorrectAnswer(context,"3");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }

          if (currentStep == 3){
            if (watch.question4.isEmpty == false){
              if(watch.question4 != "1"){
                incorrectAnswer(context,"1");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }

          if (currentStep == 4){
            if (watch.question5.isEmpty == false){
              if(watch.question5 != "4"){
                lastincorrectAnswer(context,"4");
              }
              else{
                lastcorrectAnswer(context);
                setState(() => result += 1);
              }
            }
            else{
              emptyOptions(context);
            }
            
          } 
          if (isLastStep){
              postDetailsToFirestore();
          }
                
        },
        
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length - 1 ;
          return Container(
            margin: EdgeInsets.only(top:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(  
                      child: Text(isLastStep ? 'Finish' : 'Send Answer',
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
                      onPressed: details.onStepContinue,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
  List<Step> getSteps() => [
    Step(
      isActive: currentStep >= 0,
      title: Text(''), 
      content: Column(
        children: [
          tvquestion1()
        ],
        
    )),

    Step(
      isActive: currentStep >= 1,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          tvquestion2(),
        ],
    )),

    Step(
      isActive: currentStep >= 2,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          tvquestion3()
        ],
    )),

    Step(
      isActive: currentStep >= 3,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          tvquestion4(),
        ],
      
    )),

    Step(
      isActive: currentStep >= 4,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          tvquestion5(),
        ],
      
    )),
    
    
  ];
  
  postDetailsToFirestore() async{
    // calling our firestore
    // calling our user model
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    TvCoursesModel tvcoursesModel = TvCoursesModel();
    UserModel userModel = UserModel();
    // writing all the values
    tvcoursesModel.uid = user?.uid;
    tvcoursesModel.part1_level1 = int.parse(resultcontroller.text = "$result");

  
    await firebaseFirestore
      .collection("tvcourses")
      .doc(user?.uid)
      .set(tvcoursesModel.toMap());
    
    await firebaseFirestore
    .collection("users")
    .doc(user?.uid)
    .update({"part1_level1" : result});

    if (currentStep == 4){
      sleep(const Duration(seconds: 2));
      resultAnswer(context);
    }
    
  }
  
}
 