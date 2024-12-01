
import 'package:beable/providers/animals_vocabulary/av_part1_level1.dart';
import 'package:beable/providers/general_vocabulary/gv_part1_level1.dart';
import 'package:beable/providers/initialform_provider.dart';
import 'package:beable/providers/kitchen_vocabulary/kv_part1_level1.dart';
import 'package:beable/providers/login_provider.dart';
import 'package:beable/providers/program_vocabulary/pv_part1_level1.dart';
import 'package:beable/providers/toefl_vocabulary/tv_part1_level1.dart';
import 'package:beable/providers/university_vocabulary/uv_part1_level1.dart';
import 'package:beable/screens/courses/toefl_vocabulary/part1_level1/tv_part1_level1_screen.dart';
import 'package:beable/screens/courses/toefl_vocabulary/part1_level1/tv_question1.dart';
import 'package:beable/screens/courses_screen.dart'; 
import 'package:beable/screens/home_screen.dart';
import 'package:beable/screens/initialExam/initialexam_screen.dart';
import 'package:beable/screens/initialexam/ie_question1.dart';
import 'package:beable/screens/login&register/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/toefl_vocabulary/tv_intro.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<loginFormInfo>(create: (_)=> loginFormInfo()),
        ChangeNotifierProvider<InitialFormInfo>(create: (_)=> InitialFormInfo()),
        ChangeNotifierProvider<Gv_Part1_Level1Info>(create: (_)=> Gv_Part1_Level1Info()),
        ChangeNotifierProvider<TvIntroInfo>(create: (_)=> TvIntroInfo()),
        ChangeNotifierProvider<Tv_Part1_Level1Info>(create: (_)=> Tv_Part1_Level1Info()),

        ChangeNotifierProvider<Uv_Part1_Level1Info>(create: (_)=> Uv_Part1_Level1Info()),
        ChangeNotifierProvider<Av_Part1_Level1Info>(create: (_)=> Av_Part1_Level1Info()),
        ChangeNotifierProvider<Kv_Part1_Level1Info>(create: (_)=> Kv_Part1_Level1Info()),
        ChangeNotifierProvider<Pv_Part1_Level1Info>(create: (_)=> Pv_Part1_Level1Info()),

      ],
      builder: (context,_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Be Able',
          theme: ThemeData(
            fontFamily: 'Century Gothic',
            primarySwatch:Colors.teal,
          ),
          home:HomeScreen(currentIndex: 1,),
          routes: <String, WidgetBuilder> {
          '/homescreen': (BuildContext context) =>  HomeScreen(currentIndex: 0,),
          '/initialexam' : (BuildContext context) =>  initialExam(),
  },
        );
      }
    );
  }
}

