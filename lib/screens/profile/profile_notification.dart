import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../model/user_model.dart';
import '../../providers/login_provider.dart';

class profile_notification extends StatefulWidget {
  const profile_notification({
    super.key,
  });

  @override
  State<profile_notification> createState() => _profile_notificationState();
}

class _profile_notificationState extends State<profile_notification> {
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
    });
  }

  Future refreshNotification() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("users")
        .doc(loggedInUser.uid)
        .update({"notification": loggedInUser.notification});
  }

  Widget buildSwitch() => Transform.scale(
        scale: 1,
        child: Switch.adaptive(
          value: loggedInUser.notification,
          onChanged: (value) {
            setState(() => loggedInUser.notification = value);
            refreshNotification();
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    loginFormInfo watch = context.watch<loginFormInfo>();
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.height / 2.5,
      height: size.height / 12,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: -1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.notifications, color: Colors.teal, size: 30),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              "Notificaciones",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          buildSwitch(),
        ],
      ),
    );
  }
}
