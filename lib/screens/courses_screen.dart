import 'package:beable/screens/courses/animals_vocabulary/animals_vocabulary.dart';
import 'package:beable/screens/courses/general_vocabulary/general_vocabulary.dart';
import 'package:beable/screens/courses/kitchen_vocabulary/kitchen_vocabulary.dart';
import 'package:beable/screens/courses/program_vocabulary/program_vocabulary.dart';
import 'package:beable/screens/courses/toefl_vocabulary/toefl_vocabulary.dart';
import 'package:beable/screens/courses/university_vocabulary/university_vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class coursesScreen extends StatefulWidget {
  coursesScreen({Key? key}) : super(key: key);

  @override
  State<coursesScreen> createState() => _coursesScreenState();
}

class _coursesScreenState extends State<coursesScreen> {
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
                image: AssetImage('assets/courses/top_header.png'),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            children: [ 
              Container(
                 padding: EdgeInsets.only(top:80),
                child: Text(
                  
                  "Cursos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                
                child: GridView.count(
                  
                  padding: EdgeInsets.only(top:40 ,left: 20, right: 20),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  children: [

                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => general_vocabulary()));
                      }),
                      child: Card(  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),  
                        elevation: 4,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/courses/general_vocabulary.svg', height: 128,),
                            SizedBox(height: 5,),
                             Text('General', 
                             style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century Gothic'
                              ),),
                           
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => toefl_vocabulary()));
                      }),
                      child: Card(  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),  
                        elevation: 4,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/courses/toefl_vocabulary.svg', height: 128,),
                            SizedBox(height: 5,),
                             Text('TOEFL', 
                             style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century Gothic'
                              ),),
                           
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => university_vocabulary()));
                      }),
                      child: Card(  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),  
                        elevation: 4,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/courses/university_vocabulary.svg', height: 128,),
                            SizedBox(height: 5,),
                             Text('Universidad', 
                             style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century Gothic'
                              ),),
                           
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => animals_vocabulary()));
                      }),
                      child: Card(  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),  
                        elevation: 4,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/courses/animals_vocabulary.svg', height: 128,),
                            SizedBox(height: 5,),
                             Text('Animales', 
                             style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century Gothic'
                              ),),
                           
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kitchen_vocabulary()));
                      }),
                      child: Card(  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),  
                        elevation: 4,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/courses/kitchen_vocabulary.svg', height: 128,),
                            SizedBox(height: 5,),
                             Text('Cocina', 
                             style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century Gothic'
                              ),),
                           
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => program_vocabulary()));
                      }),
                      child: Card(  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),  
                        elevation: 4,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/courses/program_vocabulary.svg', height: 128,),
                            SizedBox(height: 5,),
                             Text('Programación', 
                             style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century Gothic'
                              ),),
                           
                          ],
                        ),
                      ),
                    ),
                    



                  ],
                ),
              ),

            ],
          ),
        ],
        
                   
        ),
    );
  }
}