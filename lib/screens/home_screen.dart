// ignore_for_file: prefer_const_constructors

import 'package:beable/model/user_model.dart';
import 'package:beable/screens/dashboard/dashboard_screen.dart';
import 'package:beable/screens/courses_screen.dart';
import 'package:beable/screens/profile/settings_screen.dart';
import 'package:beable/screens/videos_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

class HomeScreen extends StatefulWidget {
  int? currentIndex;

  HomeScreen({super.key, this.currentIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      context.read<loginFormInfo>().setTexts1(uid: loggedInUser.uid);
      context
          .read<loginFormInfo>()
          .setTexts2(firstName: loggedInUser.firstName);
      context.read<loginFormInfo>().setTexts3(lastName: loggedInUser.lastName);
      context.read<loginFormInfo>().setTexts4(email: loggedInUser.email);
      context
          .read<loginFormInfo>()
          .setTexts5(donwloadURL: loggedInUser.donwloadURL);
      context
          .read<loginFormInfo>()
          .setTexts6(levelTest: loggedInUser.levelTest);
      context
          .read<loginFormInfo>()
          .setTexts7(notification: loggedInUser.notification);
      setState(() {});
      if (loggedInUser.levelTest == 0) {
        Navigator.pushReplacementNamed(context, '/initialexam');
      }
    });
  }

  int _currentIndex = 0;
  final List<Widget> _screens = [
    dashboardScreen(),
    coursesScreen(),
    vliveScreen(),
    settingsScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboardScreen();

  @override
  Widget build(BuildContext context) {
    setState(() {
      _currentIndex = widget.currentIndex!;
    });
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => widget.currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.chat, Icons.live_tv, Icons.settings]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: _currentIndex == key
                              ? Colors.blue[600]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
