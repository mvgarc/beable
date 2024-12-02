import 'package:beable/screens/dashboard/carousel_screen.dart';
import 'package:beable/screens/dashboard/learningtips.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beable/model/user_model.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({super.key});

  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
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

  Widget banner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.all(10.0),
      height: 140,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFAD9FE4), Colors.purple]),
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/dashboard/teacher.png',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¡Aprende Ingles!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Desde la comodidad\nde tu hogar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/dashboard/top_header.png'),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "BeAble",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              carouselHome(),
              SizedBox(
                height: 20,
              ),
              learningtips(),
              SizedBox(
                height: 20,
              ),
              banner(context),
            ],
          ),
        ],
      ),
    );
  }
}
