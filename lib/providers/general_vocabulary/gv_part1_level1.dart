import 'package:flutter/material.dart';

class Gv_Part1_Level1Info with ChangeNotifier{
  String _question1 = '';
  String _question2 = '';
  String _question3 = '';
  String _question4 = '';
  String _question5 = '';
  String _question6 = '';
  String _question7 = '';
  String _question8 = '';
  String _question9 = '';


  String get question1 => _question1;
  String get question2 => _question2;
  String get question3 => _question3;
  String get question4 => _question4;
  String get question5 => _question5;
  String get question6 => _question6;
  String get question7 => _question7;
  String get question8 => _question8;
  String get question9 => _question9;
  
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
  Future<void> setTexts5 ({required String value5})async {
    _question5 = value5; 
    NotificationListener;
  }
  Future<void> setTexts6 ({required String value6})async {
    _question6 = value6; 
    NotificationListener;
  }
  Future<void> setTexts7 ({required String value7})async {
    _question7 = value7; 
    NotificationListener;
  }
  Future<void> setTexts8 ({required String value8})async {
    _question8 = value8; 
    NotificationListener;
  }
  Future<void> setTexts9 ({required String value9})async {
    _question9 = value9; 
    NotificationListener;
  }

  
}