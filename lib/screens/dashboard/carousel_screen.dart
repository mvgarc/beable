import 'package:beable/screens/courses/animals_vocabulary/animals_vocabulary.dart';
import 'package:beable/screens/courses/general_vocabulary/general_vocabulary.dart';
import 'package:beable/screens/courses/kitchen_vocabulary/kitchen_vocabulary.dart';
import 'package:beable/screens/courses/program_vocabulary/program_vocabulary.dart';
import 'package:beable/screens/courses/toefl_vocabulary/toefl_vocabulary.dart';
import 'package:beable/screens/courses/university_vocabulary/university_vocabulary.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class carouselHome extends StatefulWidget {
  carouselHome({Key? key}) : super(key: key);

  @override
  State<carouselHome> createState() => _carouselHomeState();
}

class _carouselHomeState extends State<carouselHome> {

  int _current = 0 ;
  final List<String> images=[
    'assets/dashboard/carouselhome/banner_general.png',
    'assets/dashboard/carouselhome/banner_toefl.png',
    'assets/dashboard/carouselhome/banner_university.png',
    'assets/dashboard/carouselhome/banner_animals.png',
    'assets/dashboard/carouselhome/banner_kitchen.png',
    'assets/dashboard/carouselhome/banner_program.png',


  ];
  
  final List<Widget>link=[
    general_vocabulary(),
    toefl_vocabulary(),
    university_vocabulary(),
    animals_vocabulary(),
    kitchen_vocabulary(),
    program_vocabulary(),
  ];

  List<Widget> generateImagesTiles(){
    return images.map((element)=> ClipRRect(
        child: Image.asset(element,
        fit: BoxFit.contain,
        ),    
      borderRadius: BorderRadius.circular(15.0),
      
      
      
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: (const EdgeInsets.only(top:30)),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => link[_current])),
            child: CarouselSlider(items: generateImagesTiles(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 17/8,
              
              onPageChanged: (index, other){
                setState(() {
                  _current = index;
                });
              }
            )),
          ),
          
        ],
      ),
    );
  }
}