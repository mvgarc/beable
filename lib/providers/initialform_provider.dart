import 'package:flutter/material.dart';

class InitialFormInfo with ChangeNotifier{
  String _question1 = '';
  String _question2 = '';
  String _question3 = '';
  String _question4 = '';

  String get question1 => _question1;
  String get question2 => _question2;
  String get question3 => _question3;
  String get question4 => _question4;


  Future<void> setTexts1 ({required String value1})async {
    _question1 = value1; 
    NotificationListener;
  }
  Future<void> setTexts2 ({required String value2})async {
    _question2 = value2; 
    NotificationListener;
  }
  Future<void> setTexts3 ({required String value3})async {
    _question3 = value3; 
    NotificationListener;
  }
  Future<void> setTexts4 ({required String value4})async {
    _question4 = value4; 
    NotificationListener;
  }
}