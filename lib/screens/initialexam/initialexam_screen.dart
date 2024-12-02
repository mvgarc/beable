import 'package:beable/screens/initialexam/ie_question1.dart';
import 'package:beable/screens/initialexam/ie_question2.dart';
import 'package:beable/screens/initialexam/ie_question3.dart';
import 'package:beable/screens/initialexam/ie_question4.dart';
import 'package:flutter/material.dart';
import 'package:beable/model/initialform_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beable/model/user_model.dart';
import 'package:provider/provider.dart';

import '../../providers/initialform_provider.dart';

class initialExam extends StatefulWidget {
  const initialExam({super.key});

  @override
  State<initialExam> createState() => _initialExamState();
}

class _initialExamState extends State<initialExam> {
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
  final TextEditingController question1Controller = TextEditingController();
  final TextEditingController question2Controller = TextEditingController();
  final TextEditingController question3Controller = TextEditingController();
  final TextEditingController question4Controller = TextEditingController();
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    InitialFormInfo watch = context.watch<InitialFormInfo>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bienvenido a BeAble",
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
          if (isLastStep) {
            setState(() {
              question1Controller.text = watch.question1;
              question2Controller.text = watch.question2;
              question3Controller.text = watch.question3;
              question4Controller.text = watch.question4;
            });
            postDetailsToFirestore();
          } else {
            setState(() => currentStep += 1);
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() => currentStep -= 1);
          }
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length - 1;
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                if (currentStep != 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: Text('Atras',
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                  ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(isLastStep ? 'Enviar' : 'Siguiente',
                        style: TextStyle(
                          fontSize: 15,
                        )),
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
            content: Column(children: <Widget>[
              question1(),
            ])),
        Step(
            isActive: currentStep >= 1,
            title: Text(''),
            content: Column(
              children: [
                question2(),
              ],
            )),
        Step(
            isActive: currentStep >= 2,
            title: Text(''),
            content: Column(
              children: <Widget>[
                question3(),
              ],
            )),
        Step(
            isActive: currentStep >= 3,
            title: Text(''),
            content: Column(
              children: <Widget>[
                question4(),
              ],
            )),
      ];

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    InitialFormModel initialformModel = InitialFormModel();
    UserModel userModel = UserModel();
    // writing all the values
    initialformModel.uid = user?.uid;
    initialformModel.question1 = question1Controller.text;
    initialformModel.question2 = question2Controller.text;
    initialformModel.question3 = question3Controller.text;
    initialformModel.question4 = question4Controller.text;

    await firebaseFirestore
        .collection("initialforms")
        .doc(user?.uid)
        .set(initialformModel.toMap());

    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .update({"levelTest": 1});

    Navigator.pushReplacementNamed(context, '/homescreen');
  }
}
