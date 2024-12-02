import 'package:beable/screens/courses/general_vocabulary/part1_level1/gv_level1_screen.dart';
import 'package:beable/screens/profile/profileMenu.dart';
import 'package:beable/screens/profile/profile_account.dart';
import 'package:beable/screens/profile/profile_pic.dart';
import 'package:beable/screens/profile/profile_notification.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beable/model/user_model.dart';
import 'package:beable/screens/login&register/login_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';

class settingsScreen extends StatefulWidget {
  const settingsScreen({super.key});

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    loginFormInfo watch = context.watch<loginFormInfo>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: size.height * .3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/settings/top_header.png'),
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
                "Mi Perfil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  profile_pic(
                      userId: watch.uid, donwloadURL_user: watch.donwloadURL),
                  SizedBox(height: 20),
                  profileMenu(
                    icon: Icons.person,
                    text: "Mi Perfil",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profileAccount(
                                    userId: watch.uid,
                                    email: watch.email,
                                    firstname: watch.firstName,
                                    lastname: watch.lastName,
                                  )));
                    },
                  ),
                  SizedBox(height: 20),
                  profile_notification(),
                  SizedBox(height: 20),
                  profileMenu(
                    icon: Icons.help_outline,
                    text: "Ayuda",
                    press: () {},
                  ),
                  SizedBox(height: 15),
                  profileMenu(
                    icon: Icons.logout_outlined,
                    text: "Cerrar sesión",
                    press: () {
                      logout(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
