import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:beable/model/avcourses_model.dart';
import 'package:beable/providers/animals_vocabulary/av_part1_level1.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question1.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question2.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question3.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question4.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question5.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question6.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question7.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question8.dart';
import 'package:beable/screens/courses/animals_vocabulary/part1_level1/av_question9.dart';
import 'package:beable/screens/courses/animals_vocabulary/animals_vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beable/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../../home_screen.dart';
class av_part1_level1 extends StatefulWidget {
  av_part1_level1({Key? key}) : super(key: key);

  @override
  State<av_part1_level1> createState() => _av_part1_level1State();
  
}

class _av_part1_level1State extends State<av_part1_level1> 
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
          title: new Text("Resultados:",
          
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
            child: Text("$result / 9 ",
              style: TextStyle(
                color: Colors.blue,
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
                Navigator.pushAndRemoveUntil(context, 
                MaterialPageRoute(builder: (context)=> animals_vocabulary()),
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
          title: new Text("Ingresa una opcion",
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
          title: new Text("Nivel Fallido",
          
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
            child: Text("Has obtenido 3\nrespuestas incorrectas",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => animals_vocabulary()));
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
          title: new Text("Respuesta Incorrecta",
          
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
            child: Text("Respuesta: $text",
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
                Navigator.of(context).pop();
                setState(() => fails += 1);
                if (fails == 3){
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
          
          title: new Text("Respuesta Correcta",
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
          
          title: new Text("Respuesta Correcta",
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
          title: new Text("Respuesta Incorrecta",
          
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
            child: Text("Respuesta: $text",
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
    Av_Part1_Level1Info watch = context.watch<Av_Part1_Level1Info>();
    return Scaffold(
      appBar: AppBar(title: Text("Animales - Nivel 1", style: TextStyle(
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
              if(watch.question1 != "Ostrich"){
                incorrectAnswer(context,"Ostrich");
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
              if(watch.question2 != "Stork"){
                incorrectAnswer(context,"Stork");
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
              if(watch.question3 != "Sloth"){
                incorrectAnswer(context,"Sloth");
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
              if(watch.question4 != "Octopus"){
                incorrectAnswer(context,"Octopus");
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
              if(watch.question5 != "Nightingale"){
                incorrectAnswer(context,"Nightingale");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }

          if (currentStep == 5){
            if (watch.question6.isEmpty == false){
              if(watch.question6 != "Lobster"){
                incorrectAnswer(context,"Lobster");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }

          if (currentStep == 6){
            if (watch.question7.isEmpty == false){
              if(watch.question7 != "Otter"){
                incorrectAnswer(context,"Otter");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }

          if (currentStep == 7){
            if (watch.question8.isEmpty == false){
              if(watch.question8 != "Bee"){
                incorrectAnswer(context,"Bee");
              }
              else{
                correctAnswer(context);
              }
            }
            else{
              emptyOptions(context);
            }
          }
       
          if (currentStep == 8){
            if (watch.question9.isEmpty == false){
              if(watch.question9 != "Owl"){
                lastincorrectAnswer(context,"Owl");
              }
              else{
                setState(() => result += 1);
                lastcorrectAnswer(context);
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
                      child: Text(isLastStep ? 'Completado' : 'Enviar',
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
          avquestion1()
        ],
        
    )),

    Step(
      isActive: currentStep >= 1,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion2(),
        ],
    )),

    Step(
      isActive: currentStep >= 2,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion3()
        ],
    )),

    Step(
      isActive: currentStep >= 3,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion4(),
        ],
      
    )),

    Step(
      isActive: currentStep >= 4,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion5(),
        ],
      
    )),
    
    Step(
      isActive: currentStep >= 5,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion6(),
        ],
      
    )),
    
    Step(
      isActive: currentStep >= 6,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion7(),
        ],
      
    )),
   
    Step(
      isActive: currentStep >= 7,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion8(),
        ],
      
    )),
    
    Step(
      isActive: currentStep >= 8,
      title: Text(''), 
      content: Column(
        children: <Widget>[
          avquestion9(),
        ],
      
    )),
  ];
  
  postDetailsToFirestore() async{
    // calling our firestore
    // calling our user model
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    AvCoursesModel avcoursesModel = AvCoursesModel();
    UserModel userModel = UserModel();
    // writing all the values
    avcoursesModel.uid = user?.uid;
    avcoursesModel.part1_level1 = int.parse(resultcontroller.text = "$result");

  
    await firebaseFirestore
      .collection("avcourses")
      .doc(user?.uid)
      .set(avcoursesModel.toMap());
    
    await firebaseFirestore
    .collection("users")
    .doc(user?.uid)
    .update({"part1_level1" : result});

    if (currentStep == 8){
      sleep(const Duration(seconds: 2));
      resultAnswer(context);
    }
    
  }
  
}
 