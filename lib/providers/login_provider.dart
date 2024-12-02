import 'package:flutter/material.dart';

class loginFormInfo with ChangeNotifier {
  String? _uid = '';
  String? _firstName = '';
  String? _lastName = '';
  String? _email = '';
  String? _donwloadURL = '';
  late int _levelTest;
  late bool _notification;
  bool _wrongPassword = false;
  bool _wrongEmail = false;

  String? get uid => _uid;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get donwloadURL => _donwloadURL;
  int get levelTest => _levelTest;
  bool get notification => _notification;
  bool get wrongPassword => _wrongPassword;
  bool get wrongEmail => _wrongEmail;

  Future<void> setTexts1({required String? uid}) async {
    _uid = uid;
    NotificationListener;
  }

  Future<void>? setTexts2({required String? firstName}) async {
    _firstName = firstName;
    NotificationListener;
  }

  Future<void> setTexts3({required String? lastName}) async {
    _lastName = lastName;
    NotificationListener;
  }

  Future<void> setTexts4({required String? email}) async {
    _email = email;
    NotificationListener;
  }

  Future<void> setTexts5({required String? donwloadURL}) async {
    _donwloadURL = donwloadURL;
    NotificationListener;
  }

  Future<void> setTexts6({required int levelTest}) async {
    _levelTest = levelTest;
    NotificationListener;
  }

  Future<void> setTexts7({required bool notification}) async {
    _notification = notification;
    NotificationListener;
  }

  Future<void> setTexts8({required bool wrongEmail}) async {
    _wrongEmail = wrongEmail;
    NotificationListener;
  }

  Future<void> setTexts9({required bool wrongPassword}) async {
    _wrongPassword = wrongPassword;
    NotificationListener;
  }
}
