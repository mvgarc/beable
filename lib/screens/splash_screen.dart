import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:beable/screens/login&register/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override

  void initState(){
    Future.delayed(
      Duration(seconds: 3), 
      ()=> Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => LoginScreen())));
    super.initState();
  }
    // our form key
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF0ABBB5), Colors.white ]
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Spacer(),
              Center(
                child: FractionallySizedBox(
                  widthFactor: .6,
                  child: Bounce(
                    child: FlutterLogo(size: 400),
                    infinite: true,), 
                ),
              ),
              Spacer(),
              CircularProgressIndicator(),
              Spacer(),
              Text('Bienvenido / Welcome',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold, 
                fontSize:20, ), ),
              Spacer(),
            ]),
        
        
        ),
    ));
  }
}