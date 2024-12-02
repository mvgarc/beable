import 'dart:io';
import 'package:beable/providers/toefl_vocabulary/tv_intro.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question1.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question2.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question3.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question4.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question5.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question6.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question7.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question8.dart';
import 'package:beable/screens/courses/toefl_vocabulary/intro/tv_question9.dart';
import 'package:beable/screens/courses/toefl_vocabulary/toefl_vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beable/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../../../model/tvcourses_model.dart';
import '../../../home_screen.dart';

class tv_intro extends StatefulWidget {
  const tv_intro({super.key});

  @override
  State<tv_intro> createState() => _tv_introState();
}

class _tv_introState extends State<tv_intro> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController resultcontroller = TextEditingController();
  int currentStep = 0;
  bool hide = false;
  int result = 0;
  int fails = 0;

  void resultAnswer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.blue,
          title: Text(
            "Resultados:",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Text(
              "$result / 9 ",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Continuar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => toefl_vocabulary()),
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
          title: Text(
            "Ingresa una opcion",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Continuar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
          title: Text(
            "Nivel Fallido",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Text(
              "Has obtenido 3\nrespuestas incorrectas",
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Continuar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => toefl_vocabulary()));
              },
            ),
          ],
        );
      },
    );
  }

  void incorrectAnswer(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.red,
          title: Text(
            "Respuesta Incorrecta",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Text(
              "Respuesta: $text",
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Continuar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();

                setState(() => fails += 1);
                if (fails == 3) {
                  levelFail(context);
                } else {
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
          title: Text(
            "Respuesta Correcta",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Continuar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
          title: Text(
            "Respuesta Correcta",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
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

  void lastincorrectAnswer(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            backgroundColor: Colors.red,
            title: Text(
              "Respuesta Incorrecta",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              child: Text(
                "Respuesta: $text",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TvIntroInfo watch = context.watch<TvIntroInfo>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TOEFL - Inicio",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;

          if (currentStep == 0) {
            if (watch.question1.isEmpty == false) {
              if (watch.question1 != "Dazzle") {
                incorrectAnswer(context, "Dazzle");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 1) {
            if (watch.question2.isEmpty == false) {
              if (watch.question2 != "Strain") {
                incorrectAnswer(context, "Strain");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 2) {
            if (watch.question3.isEmpty == false) {
              if (watch.question3 != "Hasty") {
                incorrectAnswer(context, "Hasty");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 3) {
            if (watch.question4.isEmpty == false) {
              if (watch.question4 != "Summon") {
                incorrectAnswer(context, "Summon");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 4) {
            if (watch.question5.isEmpty == false) {
              if (watch.question5 != "Deceive") {
                incorrectAnswer(context, "Deceive");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 5) {
            if (watch.question6.isEmpty == false) {
              if (watch.question6 != "Bland") {
                incorrectAnswer(context, "Bland");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 6) {
            if (watch.question7.isEmpty == false) {
              if (watch.question7 != "Idle") {
                incorrectAnswer(context, "Idle");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 7) {
            if (watch.question8.isEmpty == false) {
              if (watch.question8 != "Slaughter") {
                incorrectAnswer(context, "Slaughter");
              } else {
                correctAnswer(context);
              }
            } else {
              emptyOptions(context);
            }
          }

          if (currentStep == 8) {
            if (watch.question9.isEmpty == false) {
              if (watch.question9 != "Upbeat") {
                lastincorrectAnswer(context, "Upbeat");
              } else {
                lastcorrectAnswer(context);
                setState(() => result += 1);
              }
            } else {
              emptyOptions(context);
            }
          }
          if (isLastStep) {
            postDetailsToFirestore();
          }
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length - 1;
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(isLastStep ? 'Completado' : 'Enviar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
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
              children: [tvquestion1()],
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
              children: <Widget>[tvquestion3()],
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
        Step(
            isActive: currentStep >= 5,
            title: Text(''),
            content: Column(
              children: <Widget>[
                tvquestion6(),
              ],
            )),
        Step(
            isActive: currentStep >= 6,
            title: Text(''),
            content: Column(
              children: <Widget>[
                tvquestion7(),
              ],
            )),
        Step(
            isActive: currentStep >= 7,
            title: Text(''),
            content: Column(
              children: <Widget>[
                tvquestion8(),
              ],
            )),
        Step(
            isActive: currentStep >= 8,
            title: Text(''),
            content: Column(
              children: <Widget>[
                tvquestion9(),
              ],
            )),
      ];

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    TvCoursesModel tvcoursesModel = TvCoursesModel();
    UserModel userModel = UserModel();
    // writing all the values
    tvcoursesModel.uid = user?.uid;
    tvcoursesModel.intro = int.parse(resultcontroller.text = "$result");

    await firebaseFirestore
        .collection("tvcourses")
        .doc(user?.uid)
        .set(tvcoursesModel.toMap());

    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .update({"intro": result});

    if (currentStep == 8) {
      sleep(const Duration(seconds: 2));
      resultAnswer(context);
    }
  }
}
